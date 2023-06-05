import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../main.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String selectedRole = "stu_home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(27, 228, 59, 0.58),
              Color.fromRGBO(66, 122, 75, 0.91),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset("assets/logo.png"),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                RadioButtonRow(
                  changed: (value) {
                    selectedRole = value;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Send data to Supabase
                      _signUp();
                    }
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _signUp() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    final response =
        await supabase.auth.signUp(email: email, password: password);

    if (response.session == null) {
      // Handle sign-up error
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text("Unable to sign up"),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        },
      );
    } else {
      // Sign-up successful
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Sign-up successful!'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(context, selectedRole);
                },
              ),
            ],
          );
        },
      );
    }
  }
}

class RadioButtonRow extends StatefulWidget {
  void Function(String value) changed;

  RadioButtonRow({super.key, required this.changed});
  @override
  _RadioButtonRowState createState() => _RadioButtonRowState();
}

class _RadioButtonRowState extends State<RadioButtonRow> {
  String _selectedRole = 'Student';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio(
          value: 'Company',
          groupValue: _selectedRole,
          onChanged: (value) {
            widget.changed('/cmp_home');
            setState(() {
              if (value != null) _selectedRole = value;
            });
          },
        ),
        Text('Company'),
        Radio(
          value: 'Student',
          groupValue: _selectedRole,
          onChanged: (value) {
            setState(() {
              widget.changed('/stu_home');
              if (value != null) _selectedRole = value;
            });
          },
        ),
        Text('Student'),
        Radio(
          value: 'Placement Officer',
          groupValue: _selectedRole,
          onChanged: (value) {
            setState(() {
              widget.changed('/pla_home');
              if (value != null) _selectedRole = value;
            });
          },
        ),
        Text(
          'Placement Officer',
          overflow: TextOverflow.fade,
        ),
      ],
    );
  }
}
