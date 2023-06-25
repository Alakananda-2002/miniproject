import 'package:campus/main.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AnswerType {
  static const radioButton = 0;
  static const checkBoxes = 1;
  static const fileUpload = 2;
  static const shortText = 3;
  static const paragraph = 4;

  static const values = [
    'Multiple choice',
    'CheckBoxes',
    'Short Answer',
    'Paragraph',
    'File upload',
  ];
  static const icons = [
    Icons.radio_button_checked,
    Icons.check_box,
    Icons.short_text,
    Icons.filter_list,
    Icons.file_present_rounded,
  ];
}

class Question {
  int answerType;
  String category = 'General';
  final questionController = TextEditingController();
  final List<TextEditingController> _controllers = [TextEditingController()];
  Question(this.answerType);

  Map<String, dynamic> toJson() {
    return {
      "question": questionController.text,
      "answerType": answerType,
      "category": category,
      if (answerType < 2) "options": _controllers.map((e) => e.text).toList(),
    };
  }
}

class AddQuestionsPage extends StatefulWidget {
  const AddQuestionsPage({super.key});

  @override
  State<StatefulWidget> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<AddQuestionsPage> {
  final ScrollController _scrollController = ScrollController();
  final List<Question> _questions = [Question(AnswerType.radioButton)];
  String questionCategory = 'General';

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void validateQuestions() {}

  void sendQuestions() async {
    // //////////////////////////////////////////////////////////////
    try {
      var uri = Uri.parse("");
      FocusScope.of(context).unfocus();
      for (var i in _questions) {
        i.category = questionCategory;
      }

      var response = await http.post(uri,
          body: {"data": jsonEncode(_questions), "token": "jwtTOKEN"});

      if (response.statusCode == 200) {
        final res = json.decode(response.body);
        if (res['status'] == 'success') {
          if (context.mounted) {
            showSnackBar(context, "Data submitted to the server");
          }
          setState(() {
            _questions.clear();
            _questions.add(Question(AnswerType.radioButton));
          });
        } else {
          if (context.mounted) {
            showSnackBar(context, "Unexpected error occured .Please retry");
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(231, 231, 231, 1),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 149, 233, 181) ??
                    Color.fromARGB(255, 38, 225, 110),
                Color.fromARGB(255, 38, 225, 110)
              ],
            ),
          ),
          child: WillPopScope(
            onWillPop: () async {
              return (await showDialog<bool>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Confirmation'),
                        content: const Text('Are you sure you want to exit?'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('No'),
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                          ),
                          TextButton(
                            child: const Text('Yes'),
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                          ),
                        ],
                      );
                    },
                  )) ??
                  false;
            },
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    "Add Questions",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                CategorySelector(
                  category: questionCategory,
                  onCategoryChanged: (String? cat,
                      Future<bool> Function(String?) addCategory) {
                    if (cat == "Add") {
                      showDialog(
                          context: context,
                          builder: (context) {
                            TextEditingController controller =
                                TextEditingController(text: "");
                            return AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Enter  category name "),
                                  TextField(controller: controller)
                                ],
                              ),
                              actions: [
                                TextButton(
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                TextButton(
                                    child: Text("Add"),
                                    onPressed: () async {
                                      if (controller.text != '') {
                                        if (await addCategory(
                                            controller.text)) {
                                          setState(() {
                                            questionCategory = controller.text;
                                          });
                                        } else {
                                          if (context.mounted) {
                                            showSnackBar(context,
                                                "unable to add category");
                                          }
                                        }

                                        Navigator.of(context).pop();
                                      } else {
                                        Navigator.of(context).pop();
                                        showSnackBar(
                                          context,
                                          "Error : Category name cannot be empty",
                                        );
                                      }
                                    })
                              ],
                            );
                          });
                    } else {
                      setState(() {
                        questionCategory = cat ?? "General";
                      });
                    }
                  },
                ),
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: _questions.length,
                    itemBuilder: (context, index) => QuestionBlock(
                      question: _questions[index],
                      onDelete: () => setState(() {
                        _questions.removeAt(index);
                      }),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomNavigationBar(
            iconSize: 30.0,
            selectedColor: const Color(0xff040307),
            strokeColor: const Color(0x30040307),
            unSelectedColor: const Color.fromARGB(255, 0, 0, 0),
            backgroundColor: Colors.white,
            items: [
              CustomNavigationBarItem(
                icon: const Icon(Icons.add_box_rounded),
              ),
              CustomNavigationBarItem(
                icon: const Icon(
                  Icons.save,
                  size: 30,
                ),
              ),
            ],
            onTap: (index) async {
              if (index == 0) {
                setState(() {
                  _questions.add(Question(AnswerType.radioButton));
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  });
                });
              } else if (index == 1) {
                if (_questions.isEmpty) {
                  ScaffoldMessenger.of(context)
                      .showMaterialBanner(const MaterialBanner(
                    content: Text("Cannot submit empty form"),
                    actions: [
                      Icon(
                        Icons.warning,
                        color: Colors.amber,
                      )
                    ],
                  ));

                  Future.delayed(Duration(seconds: 2), () {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context)
                          .removeCurrentMaterialBanner();
                    }
                  });
                  return;
                }
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Confirmation'),
                      content: Text(
                          'Save and submit the Question to the $questionCategory category?'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('No'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Yes'),
                          onPressed: () {
                            sendQuestions();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}

class CategorySelector extends StatefulWidget {
  final void Function(
          String? category, Future<bool> Function(String?) addCatergory)
      onCategoryChanged;
  final String category;
  const CategorySelector(
      {super.key, required this.category, required this.onCategoryChanged});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  List categories = ['General', 'Add'];
  @override
  void initState() {
    (() async {
      var resp = await supabase.from('categories').select();
      if (resp.length != 0) {
        categories.remove("Add");
        for (var i in resp) {
          if (i!['name'] == 'General') categories.remove("General");

          categories.add(i["name"]);
        }

        categories.add("Add");
        setState(() {});
      }
    })();

    super.initState();
  }

  Future<bool> addNewCategory(String? cat) async {
    if (cat == null) {
      return false;
    } else {
      var res = null;

      supabase.from("categories").insert({"name": cat});

      if (context.mounted) {
        showSnackBar(context, "$cat added to categories");
        setState(() {
          categories.insert(categories.length - 1, cat);
        });
        return true;
      } else
        return false;
    }
  }

  List<DropdownMenuItem<String>> getDropDownList() {
    List<DropdownMenuItem<String>> list = [];
    for (int i = 0; i < categories.length; i++) {
      list.add(DropdownMenuItem<String>(
          value: categories[i],
          child: Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                child:
                    Icon((categories[i] == 'Add') ? Icons.add : Icons.category),
              ),
              Text(categories[i])
            ],
          )));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: DropdownButton<String>(
          value: widget.category,
          items: getDropDownList(),
          onChanged: (str) => widget.onCategoryChanged(str, addNewCategory),
        ));
  }
}

class QuestionBlock extends StatefulWidget {
  final Question question;
  final void Function() onDelete;

  const QuestionBlock(
      {super.key, required this.question, required this.onDelete});

  @override
  State<StatefulWidget> createState() => _QuestionBlockState();
}

class _QuestionBlockState extends State<QuestionBlock> {
  Widget answerOptions() {
    switch (widget.question.answerType) {
      case AnswerType.checkBoxes:
      case AnswerType.radioButton:
        return Editor(
            type: (widget.question.answerType == AnswerType.radioButton)
                ? EditorType.radioButtonType
                : EditorType.checkBoxType,
            controllers: widget.question._controllers,
            onAddedOption: () {
              setState(() {
                widget.question._controllers.add(TextEditingController());
              });
            },
            onDeletedOption: (index) {
              setState(() {
                widget.question._controllers.removeAt(index);
              });
            });
    }

    return Text(
      AnswerType.values[widget.question.answerType],
      style: const TextStyle(fontSize: 17),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: const BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 1)], color: Colors.white),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            InkWell(
              child: Icon(Icons.clear),
              onTap: widget.onDelete,
            )
          ]),
          TextField(
            controller: widget.question.questionController,
            decoration: const InputDecoration(
              enabledBorder: InputBorder.none,
              hintText: 'Write the question...',
            ),
          ),
          Row(
            children: [
              const Text('Answer type  :'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnswerTypeChooser(
                    value: AnswerType.values[widget.question.answerType],
                    onChanged: (val) {
                      setState(() {
                        if (val != null) {
                          widget.question.answerType =
                              AnswerType.values.indexOf(val);
                        }
                      });
                    }),
              ),
            ],
          ),
          answerOptions()
        ],
      ),
    );
  }
}

class AnswerTypeChooser extends StatelessWidget {
  final String value;
  final void Function(String? val) onChanged;
  const AnswerTypeChooser(
      {super.key, required this.value, required this.onChanged});

  List<DropdownMenuItem<String>> getDropDownList() {
    List<DropdownMenuItem<String>> list = [];
    for (int i = 0; i < AnswerType.values.length; i++) {
      list.add(DropdownMenuItem<String>(
          value: AnswerType.values[i],
          child: Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                child: Icon(AnswerType.icons[i]),
              ),
              Text(AnswerType.values[i])
            ],
          )));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      items: getDropDownList(),
      onChanged: onChanged,
    );
  }
}

enum EditorType { radioButtonType, checkBoxType }

class Editor extends StatelessWidget {
  final List<TextEditingController> controllers;
  final void Function(int) onDeletedOption;
  final void Function() onAddedOption;
  final EditorType type;
  const Editor(
      {super.key,
      required this.type,
      required this.controllers,
      required this.onDeletedOption,
      required this.onAddedOption});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          controllers.length,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon((type == EditorType.radioButtonType)
                      ? Icons.radio_button_off_outlined
                      : Icons.check_box_outline_blank),
                ),
                Expanded(
                    child: TextField(
                  controller: controllers[index],
                  decoration: InputDecoration(
                      hintText: 'options ${index + 1}',
                      enabledBorder: InputBorder.none),
                )),
                (controllers.length != 1)
                    ? InkWell(
                        child: const Icon(Icons.clear),
                        onTap: () => onDeletedOption(index),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: onAddedOption,
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 10.0, top: 10, bottom: 10, right: 5),
                child: Icon(Icons.add),
              ),
              Text("Add option")
            ],
          ),
        ),
      ],
    );
  }
}

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
