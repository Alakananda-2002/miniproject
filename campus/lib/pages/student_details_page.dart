import 'package:campus/main.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StudentDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/logo.png'),
                  radius: 40.0,
                ),
                Text(
                  'Student Name',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: () {
                // Handle home button press
              },
              icon: Icon(Icons.home),
              label: Text('Home'),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "/stu_profile");
              },
              icon: Icon(Icons.person),
              label: Text('My Profile'),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton.icon(
              onPressed: () {
                // Handle current status button press
              },
              icon: const Icon(Icons.assignment),
              label: const Text('Current Status'),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton.icon(
              onPressed: () {
                // Handle settings button press
              },
              icon: Icon(Icons.settings),
              label: Text('Settings'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton.icon(
              onPressed: () async {
                // Handle logout button press
                await supabase.auth.signOut();
                Navigator.of(context).pushNamed('/login');
              },
              icon: Icon(Icons.exit_to_app),
              label: Text('Logout'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton.icon(
              onPressed: () {
                // Handle about us button press
              },
              icon: Icon(Icons.info),
              label: Text('About Us'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton.icon(
              onPressed: () {
                // Handle help button press
              },
              icon: Icon(Icons.help),
              label: Text('Help'),
            ),
          ],
        ),
      ),
    );
  }
}