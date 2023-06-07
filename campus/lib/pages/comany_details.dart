import 'package:campus/main.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  runApp(CompanyDetailsPage());
}

class CompanyDetailsPage extends StatefulWidget {
  @override
  _CompanyDetailsPageState createState() => _CompanyDetailsPageState();
}

class _CompanyDetailsPageState extends State<CompanyDetailsPage> {
  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _companyemailController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _websiteController = TextEditingController();
  TextEditingController _imageController = TextEditingController();

  void _submitForm() async {
    try {
      final rep = await Supabase.instance.client.from('company').update({
        "name": _companyNameController.text,
        "email": _companyemailController.text,
        "description": _descriptionController.text,
        "website": _websiteController.text,
        "image": _imageController.text
      }).eq("uuid", supabase.auth.currentSession?.user.id);

      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: Text("Details Updated"),
                content: Icon(
                  Icons.check,
                  size: 50,
                  color: Colors.green,
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamedAndRemoveUntil(
                            context, "/cmp_home", (route) => false);
                      },
                      child: Text("ok"))
                ],
              ));
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();

    (() async {
      final response = await Supabase.instance.client
          .from('company')
          .select()
          .eq("uuid", supabase.auth.currentSession?.user.id);
      print(response.toString());
      for (var i in response) {
        _companyNameController.text = i['name'];
        _companyemailController.text = i['email'];
        _descriptionController.text = i['description'];
        _websiteController.text = i['website'];
        _imageController.text = i['image'];
      }
    })();
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
              controller: _companyemailController,
              decoration: InputDecoration(labelText: 'Company Email'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _websiteController,
              decoration: InputDecoration(labelText: 'Website link'),
            ),
            TextField(
              controller: _imageController,
              decoration: InputDecoration(labelText: 'Image link'),
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
