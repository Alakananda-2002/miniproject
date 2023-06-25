import 'package:campus/main.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<News> newsList = [];
  @override
  void initState() {
    super.initState();
    (() async {
      final response =
          await Supabase.instance.client.from('new_updates').select();
      print(response.toString());
      for (var i in response) {
        newsList.add(News(
            id: i['id'],
            title: i['heading'],
            description: i['description'],
            imageUrl: i["image"]));
      }
      setState(() {});
    })();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: (newsList.isEmpty)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 121, 121, 121)
                            .withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  margin: EdgeInsets.all(10),
                  child: Column(children: [
                    Image.network(newsList[index].imageUrl),
                    Text(
                      newsList[index].title,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(newsList[index].description,
                        style: const TextStyle(fontSize: 14)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              await Supabase.instance.client
                                  .from('applied')
                                  .insert({
                                "student_id":
                                    supabase.auth.currentSession?.user.id,
                                "news_id": newsList[index].id
                              });

                              if (mounted) {
                                showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                          content: const Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.check_rounded,
                                                color: Colors.green,
                                                size: 50,
                                              ),
                                              Text(
                                                  "Your Application for this role was successfully submitted .The company will notify the remaining procedure soon.")
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("OK"))
                                          ],
                                        ));
                              }
                            },
                            child: const Text("Apply now"))
                      ],
                    )
                  ]),
                );
              },
            ),
    );
  }
}

class News {
  final int id;
  final String title;
  final String description;
  final String imageUrl;

  News({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}
