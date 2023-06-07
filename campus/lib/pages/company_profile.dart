import 'package:campus/main.dart';
import 'package:flutter/material.dart';

class CompanyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Company Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/logo.png'),
                  radius: 40.0,
                ),
                Text(
                  'Company Name',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: () {
                // Handle home button press
              },
              icon: Icon(Icons.home),
              label: Text('Home'),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pushNamed("/cmp_details");
                },
                icon: Icon(Icons.business),
                label: Text('Company Profile'),
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle current recruiting button press
                },
                icon: Icon(Icons.work),
                label: Text('Current Recruiting'),
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle settings button press
                },
                icon: Icon(Icons.settings),
                label: Text('Settings'),
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton.icon(
              onPressed: () {
                supabase.auth.signOut();
                Navigator.pushReplacementNamed(context, "/login");
              },
              icon: Icon(Icons.exit_to_app),
              label: Text('Logout'),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle about us button press
                },
                icon: Icon(Icons.info),
                label: Text('About Us'),
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle help button press
                },
                icon: Icon(Icons.help),
                label: Text('Help'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
