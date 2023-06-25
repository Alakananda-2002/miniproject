import 'package:campus/main.dart';
import 'package:flutter/material.dart';

class AppliedDetailsPage extends StatefulWidget {
  const AppliedDetailsPage({super.key});

  @override
  State<AppliedDetailsPage> createState() => _AppliedDetailsPageState();
}

class _AppliedDetailsPageState extends State<AppliedDetailsPage> {
  List<Details> details = [
    Details(id: 1, news: "IBm tech interview", student: "Amitha kp"),
    Details(id: 1, news: "TCS interview", student: "Fathima"),
    Details(id: 1, news: "TATA interview", student: "Alakanadha")
  ];

  @override
  void initState() {
    super.initState();
    (() async {
      var appl = await supabase.from('applied').select();
      var stu = await supabase.from('student').select();
      var news = await supabase.from('new_updates').select();
    })();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 40, left: 14, right: 14),
        child: ListView.builder(
            itemCount: details.length,
            itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.all(20),
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(details[index].news),
                    Text("Applied by : ${details[index].student}"),
                    ElevatedButton(
                        onPressed: () {}, child: Text("Visit student profile")),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: () {}, child: Text("Shedule interview")),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red)),
                            onPressed: () async {
                              await supabase
                                  .from('applied')
                                  .update({"status": "rejected"}).eq(
                                      "id", details[index].id);
                            },
                            child: Text("Reject")),
                      ],
                    )
                  ],
                ),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(62, 0, 0, 0), blurRadius: 3)
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(10))))),
      ),
    );
  }
}

class Details {
  int id;
  String student;
  String news;
  Details({required this.id, required this.news, required this.student});
}
