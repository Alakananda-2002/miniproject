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
        'firstNameController': _firstNameController.text,
        'lastNameController': _lastNameController.text,
        'addressController': _addressController.text,
        'mobileNumberController': _mobileNumberController.text,
        'dateOfBirthController': _dateOfBirthController.text,
        'qualificationController': _qualificationController.text,
        'degreeProgramController': _degreeProgramController.text,
        'majorStreamController': _majorStreamController.text,
        'institutionController': _institutionController.text,
        'languageController': _languageController.text,
        'cgpaController': _cgpaController.text,
        'projectController': _projectController.text,
        'skillsController': _skillsController.text,
      },
    ).match({'firstNameController': _firstNameController.text});
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              content: Text("Data Updated succesfully"),
              actions: [
                TextButton(onPressed: () {}, child: Text("Hello world"))
              ],
            ));
  }

  @override
  void initState() {
    super.initState();

    (() async {
      final response = await Supabase.instance.client.from('student').select();
      for (var i in response) {
        _firstNameController.text = i['firstnamecontroller'];
        _lastNameController.text = i['lastnamecontroller'];
        _addressController.text = i['addresscontroller'];
        _mobileNumberController.text = i['mobilenumbercontroller'];
        _dateOfBirthController.text = i['dateofbirthcontroller'];
        _degreeProgramController.text = i['degreeprogramcontroller'];
        _institutionController.text = i['institutioncontroller'];
        _languageController.text = i['languagecontroller'];
        _cgpaController.text = i['cgpacontroller'];
        _projectController.text = i['projectcontroller'];
        _skillsController.text = i['skillscontroller'];
        _qualificationController.text = i['qualificationcontroller'];
        _majorStreamController.text = i['majorstreamcontroller'];
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
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'First Name'),
              ),
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Last Name'),
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
                controller: _projectController,
                decoration: InputDecoration(labelText: 'Project'),
              ),
              TextField(
                controller: _skillsController,
                decoration: InputDecoration(labelText: 'Skills'),
              ),
              SizedBox(height: 20.0),
              Text(
                'Uploaded File: $_uploadedFileName',
                style: TextStyle(fontSize: 16.0),
              ),
              ElevatedButton(
                onPressed: _uploadFile,
                child: Text('Upload Document'),
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
