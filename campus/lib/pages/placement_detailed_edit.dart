import 'package:campus/main.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PlacementOfficerDetailsPage extends StatefulWidget {
  @override
  _PlacementOfficerDetailsPageState createState() =>
      _PlacementOfficerDetailsPageState();
}

class _PlacementOfficerDetailsPageState
    extends State<PlacementOfficerDetailsPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _institutionController = TextEditingController();
  TextEditingController _branchController = TextEditingController();

  bool isEmpty = false;

  void _submitForm() async {
    // Implement form submission functionality here
    final response =
        await Supabase.instance.client.from('placement_officer').update({
      "name": _nameController.text,
      "phone": _phoneController.text,
      "institution": _institutionController.text,
      "branch": _branchController.text
    }).eq("uuid", supabase.auth.currentUser?.id);
  }

  @override
  void initState() {
    super.initState();
    (() async {
      final response =
          await Supabase.instance.client.from('placement_officer').select();
      print(response.toString());
      for (var i in response) {
        _nameController.text = i['name'];
        _phoneController.text = i['phone'];
        _institutionController.text = i['institution'];
        _branchController.text = i['branch'];
      }
      setState(() {});
    })();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Placement Officer Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            TextField(
              controller: _institutionController,
              decoration: InputDecoration(labelText: 'Institution'),
            ),
            TextField(
              controller: _branchController,
              decoration: InputDecoration(labelText: 'Branch'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
