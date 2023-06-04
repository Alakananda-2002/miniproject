import 'package:flutter/material.dart';

void main() {
  runApp(CompanyDetailsPage());
}

class CompanyDetailsPage extends StatefulWidget {
  @override
  _CompanyDetailsPageState createState() => _CompanyDetailsPageState();
}

class _CompanyDetailsPageState extends State<CompanyDetailsPage> {
  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _companyRankController = TextEditingController();
  TextEditingController _vacanciesController = TextEditingController();
  TextEditingController _preferredLanguagesController = TextEditingController();
  TextEditingController _requirementsController = TextEditingController();

  void _submitForm() {
    // Implement form submission functionality here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Details'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _companyNameController,
              decoration: InputDecoration(labelText: 'Company Name'),
            ),
            TextField(
              controller: _companyRankController,
              decoration: InputDecoration(labelText: 'Company Rank'),
            ),
            TextField(
              controller: _vacanciesController,
              decoration: InputDecoration(labelText: 'Vacancies'),
            ),
            TextField(
              controller: _preferredLanguagesController,
              decoration: InputDecoration(labelText: 'Preferred Languages'),
            ),
            TextField(
              controller: _requirementsController,
              decoration: InputDecoration(labelText: 'Requirements'),
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
