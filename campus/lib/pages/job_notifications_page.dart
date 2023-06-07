import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class JobNotificationPage extends StatefulWidget {
  @override
  _JobNotificationPageState createState() => _JobNotificationPageState();
}

class _JobNotificationPageState extends State<JobNotificationPage> {
  List<Job> jobs = [
    Job(
      company: 'Company A',
      position: 'Software Developer',
      location: 'City X',
    ),
    Job(
      company: 'Company B',
      position: 'Frontend Developer',
      location: 'City Y',
    ),
    Job(
      company: 'Company C',
      position: 'Data Scientist',
      location: 'City Z',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Notification'),
      ),
      body: ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(jobs[index].position),
            subtitle: Text(jobs[index].company),
            trailing: Text(jobs[index].location),
          );
        },
      ),
    );
  }
}

class Job {
  final String company;
  final String position;
  final String location;

  Job({
    required this.company,
    required this.position,
    required this.location,
  });
}
