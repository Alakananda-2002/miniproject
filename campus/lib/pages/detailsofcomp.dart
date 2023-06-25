import 'package:campus/main.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CompDetails extends StatefulWidget {
  const CompDetails({super.key});

  @override
  State<CompDetails> createState() => _PlacementStudentDetailsState();
}

class _PlacementStudentDetailsState extends State<CompDetails> {
  List<Comp> lists = [];

  @override
  void initState() {
    super.initState();
    (() async {
      var res = await supabase.from('company').select();
      print(res);
      for (var i in res) {
        lists.add(Comp(
            name: i['name'],
            email: i['email'],
            website: i['website'],
            description: i['description']));
      }
      setState(() {});
    })();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: lists.length,
            itemBuilder: (ctx, index) => Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(lists[index].name ?? "Not Avilable"),
                      Text(lists[index].email ?? "-"),
                      Text(lists[index].description ?? "-"),
                      TextButton(
                        child: Text(lists[index].website ?? "-"),
                        onPressed: () =>
                            {launchUrl(Uri.parse(lists[index].website ?? "-"))},
                      )
                      // Text(lists[index].qualification ?? "-"),
                    ],
                  ),
                )));
  }
}

class Comp {
  String? name, email, website, description;
  Comp(
      {required this.name,
      required this.email,
      required this.website,
      required this.description});
}
