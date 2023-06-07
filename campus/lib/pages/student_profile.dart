import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../main.dart';

class StudentProfileDetailsPage extends StatefulWidget {
  @override
  _StudentDetailsPageState createState() => _StudentDetailsPageState();
}

class _StudentDetailsPageState extends State<StudentProfileDetailsPage> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _dateOfBirthController = TextEditingController();
  TextEditingController _qualificationController = TextEditingController();
  TextEditingController _degreeProgramController = TextEditingController();
  TextEditingController _majorStreamController = TextEditingController();
  TextEditingController _institutionController = TextEditingController();
  TextEditingController _languageController = TextEditingController();
  TextEditingController _cgpaController = TextEditingController();
  TextEditingController _projectController = TextEditingController();
  TextEditingController _skillsController = TextEditingController();

  String _uploadedFileName = '';

  void _uploadFile() {
    // Implement file upload functionality here
  }

  void _submitForm() async {
    final supabase = Supabase.instance.client;

    final response = await supabase.from('student').update(
      {
        "name": _firstNameController.text,
        "address": _addressController.text,
        "phn no": _mobileNumberController.text,
        "date of birth": _dateOfBirthController.text,
        "qualification": _qualificationController.text,
        "degree program": _degreeProgramController.text,
        "institution": _institutionController.text,
        "language": _languageController.text,
        "CGPA": double.parse(_cgpaController.text),
        "skills": _skillsController.text,
        "major stream": _majorStreamController.text,
      },
    ).match({'uuid': supabase.auth.currentSession?.user.id});
    if (context.mounted) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                content: const Text("Data Updated succesfully"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, "/stu_home", (Route<dynamic> al) => false);
                      },
                      child: const Text("ok"))
                ],
              ));
    }
  }

  @override
  void initState() {
    super.initState();

    (() async {
      final response = await Supabase.instance.client
          .from('student')
          .select()
          .eq("uuid", supabase.auth.currentSession?.user.id);
      print(response.toString());
      for (var i in response) {
        _firstNameController.text = i['name'];
        _addressController.text = i['address'];
        _mobileNumberController.text = i['phn no'];
        _dateOfBirthController.text = i['date of birth'];
        _qualificationController.text = i['qualification'];
        _degreeProgramController.text = i['degree program'];
        _institutionController.text = i['institution'];
        _languageController.text = i['language'];
        _cgpaController.text = i['CGPA'].toString();
        _skillsController.text = i['skills'];
        _majorStreamController.text = i['major stream'];
        break;
      }
    })();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Student Details'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Edit Student Details",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              TextField(
                controller: _mobileNumberController,
                decoration: InputDecoration(labelText: 'Mobile Number'),
              ),
              TextField(
                controller: _dateOfBirthController,
                decoration: InputDecoration(labelText: 'Date of Birth'),
              ),
              TextField(
                controller: _qualificationController,
                decoration: InputDecoration(labelText: 'Qualification'),
              ),
              TextField(
                controller: _degreeProgramController,
                decoration: InputDecoration(labelText: 'Degree Program'),
              ),
              TextField(
                controller: _majorStreamController,
                decoration: InputDecoration(labelText: 'Major Stream'),
              ),
              TextField(
                controller: _institutionController,
                decoration: InputDecoration(labelText: 'Institution'),
              ),
              TextField(
                controller: _languageController,
                decoration: InputDecoration(labelText: 'Language'),
              ),
              TextField(
                controller: _cgpaController,
                decoration: InputDecoration(labelText: 'CGPA'),
              ),
              TextField(
                controller: _skillsController,
                decoration: InputDecoration(labelText: 'Skills'),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
