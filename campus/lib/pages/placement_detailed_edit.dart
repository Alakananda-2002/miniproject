import 'package:flutter/material.dart';

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

  void _submitForm() {
    // Implement form submission functionality here
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
