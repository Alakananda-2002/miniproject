import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../main.dart';

class AddNewsPage extends StatefulWidget {
  const AddNewsPage({super.key});

  @override
  State<AddNewsPage> createState() => _AddNewsPageState();
}

class _AddNewsPageState extends State<AddNewsPage> {
  var _Headingcontroller = new TextEditingController();
  var _Descriptioncontroller = new TextEditingController();
  String? filePath = null;
  String? fileName = null;

  void pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null) {
        setState(() {
          filePath = result.files.single.path;
          fileName = result.files.single.name;
        });
      }
    } catch (e) {
      print('Error while picking the file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 20),
                child: Text(
                  "Add news update",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              TextField(
                controller: _Headingcontroller,
                decoration: InputDecoration(hintText: "Heading"),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _Descriptioncontroller,
                maxLines: null,
                decoration: InputDecoration(hintText: "Description"),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(fileName ?? "No file selected"),
                    ElevatedButton(
                        onPressed: () {
                          pickFile();
                        },
                        child: Text("upload image")),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (_Headingcontroller.text.isEmpty ||
                        _Descriptioncontroller.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please fill all fields')));
                      return;
                    }
                    if (filePath == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please select a file')));
                      return;
                    }

                    final avatarFile = File(filePath!);
                    final GenFilename = "${Random().nextInt(1000)}$fileName";
                    var filelink =
                        "https://zwscfjqqwjygfkyqzprm.supabase.co/storage/v1/object/public/mini/news/$GenFilename";
                    final String path =
                        await supabase.storage.from('mini').upload(
                              'news/$GenFilename',
                              avatarFile,
                              fileOptions: const FileOptions(
                                  cacheControl: '3600', upsert: false),
                            );

                    await Supabase.instance.client.from("new_updates").insert({
                      "heading": _Headingcontroller.text,
                      "description": _Descriptioncontroller.text,
                      "image": filelink,
                    });

                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.check,
                                    size: 30,
                                    color: Colors.green,
                                  ),
                                  Text("News posted succesfully")
                                ],
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK"))
                              ],
                            ));
                  },
                  child: Text("Submit")),
            ],
          ),
        ),
      ),
    );
  }
}
