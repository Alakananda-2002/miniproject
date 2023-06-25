import 'package:campus/pages/application.dart';
import 'package:flutter/material.dart';

class TrainingProgramButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add your desired functionality here
      },
      child: Text('Training Program'),
    );
  }
}

class TrainingProgramDetails extends StatelessWidget {
  final String title;
  final String description;

  TrainingProgramDetails({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          description,
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Training Programs'),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrainingProgramDetails(
                    title: 'Resume Writing Workshops',
                    description:
                        'Resume writing workshops help students create effective resumes that highlight their skills, experiences, and achievements in a professional manner.',
                  ),
                ),
              );
            },
            child: Text("nmbmbmn"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrainingProgramDetails(
                    title: 'Interview Skills Training',
                    description:
                        'Interview skills training includes mock interviews and guidance on interview techniques, including how to answer common interview questions, present oneself confidently, and make a positive impression on potential employers.',
                  ),
                ),
              );
            },
            child: Text("jhds"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrainingProgramDetails(
                    title: 'Communication and Soft Skills Development',
                    description:
                        'Communication and soft skills development programs focus on improving verbal and written communication skills, interpersonal skills, teamwork, leadership, problem-solving, and other essential soft skills that employers value.',
                  ),
                ),
              );
            },
            child: Text("Helllo"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrainingProgramDetails(
                    title: 'Aptitude and Technical Skills Training',
                    description:
                        'Aptitude and technical skills training sessions enhance students\' skills required for specific job roles or industries. This can include topics such as coding, programming languages, data analysis, problem-solving, etc.',
                  ),
                ),
              );
            },
            child: Text("dbsekjf"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TrainingProgramDetails(
                    title: 'Career Counseling',
                    description:
                        'Career counseling offers individualized guidance to help students identify their strengths, interests, and career goals. It provides assistance on career paths, job search strategies, and options for higher education.',
                  ),
                ),
              );
            },
            child: Text("ewjrjfk"),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddQuestionsPage()));
              },
              child: Text("New mock test"))
        ],
      ),
    );
  }
}
