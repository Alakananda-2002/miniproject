import 'package:campus/main.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CurrentStatus extends StatefulWidget {
  const CurrentStatus({super.key});

  @override
  State<CurrentStatus> createState() => _CurrentStatusState();
}

class _CurrentStatusState extends State<CurrentStatus> {
  List<AppliedDetails> newsList = [];
  @override
  void initState() {
    super.initState();
    (() async {
      final response = await Supabase.instance.client
          .from('jobapp')
          .select()
          .filter('uid', 'eq', supabase.auth.currentUser?.id);

      for (var i in response) {
        newsList
            .add(AppliedDetails(heading: i["heading"], status: i["status"]));
      }
      setState(() {});
    })();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Current Status"),
        ),
        body: ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (ctx, index) => Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(20),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Column(
                    children: [
                      Text(newsList[index].heading as String ?? "NO NAME"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            "Status: ${newsList[index].status as String ?? 'STATUS'}"),
                      )
                    ],
                  ),
                )));
  }
}

class AppliedDetails {
  String heading, status;
  AppliedDetails({required this.heading, required this.status});
}
