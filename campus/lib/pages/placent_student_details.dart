import 'package:campus/main.dart';
import 'package:flutter/material.dart';

class PlacementStudentDetails extends StatefulWidget {
  const PlacementStudentDetails({super.key});

  @override
  State<PlacementStudentDetails> createState() =>
      _PlacementStudentDetailsState();
}

class _PlacementStudentDetailsState extends State<PlacementStudentDetails> {
  List<Students> lists = [];

  @override
  void initState() {
    super.initState();
    (() async {
      var res = await supabase.from('student').select();
      print(res);
      for (var i in res) {
        lists.add(Students(
            name: i['name'],
            phn_no: i['phn no'],
            email: i['email'],
            address: i['address'],
            degree_program: i['digree'],
            major_stream: i['major stream'],
            qualification: i['qualification']));
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
                      Text(lists[index].address ?? "-"),
                      Text(lists[index].degree_program ?? "-"),
                      Text(lists[index].phn_no ?? "-"),
                      Text(lists[index].qualification ?? "-"),
                    ],
                  ),
                )));
  }
}

class Students {
  String? name,
      phn_no,
      email,
      address,
      qualification,
      degree_program,
      major_stream;
  Students(
      {required this.name,
      required this.phn_no,
      required this.email,
      required this.address,
      required this.degree_program,
      required this.major_stream,
      required this.qualification});
}
