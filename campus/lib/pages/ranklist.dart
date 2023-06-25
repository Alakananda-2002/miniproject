import 'package:flutter/material.dart';

class Student {
  final int id;
  final String name;
  final double score;

  Student({required this.id, required this.name, required this.score});
}

class RankListButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RankListPage(),
          ),
        );
      },
      child: Text('Rank List'),
    );
  }
}

class RankListPage extends StatelessWidget {
  final List<Student> students = [
    Student(id: 1, name: 'John', score: 85.5),
    Student(id: 2, name: 'Alice', score: 92.0),
    Student(id: 3, name: 'Bob', score: 78.3),
    // Add more student data here
  ];
  RankListPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rank List'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return ListTile(
            leading: Text(student.id.toString()),
            title: Text(student.name),
            trailing: Text(student.score.toString()),
          );
        },
      ),
    );
  }
}
