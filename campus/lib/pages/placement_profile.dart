import 'package:campus/main.dart';
import 'package:campus/pages/placement_detailed_edit.dart';
import 'package:flutter/material.dart';

class PlacementOfficerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Placement Officer Page'),
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
                  backgroundImage: AssetImage('assets/profile_icon.png'),
                  radius: 40.0,
                ),
                Text(
                  'Placement Officer',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle home button press
                },
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => PlacementOfficerDetailsPage()));
                },
                icon: Icon(Icons.person),
                label: Text('Profile'),
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
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle statistics button press
                },
                icon: Icon(Icons.bar_chart),
                label: Text('Statistics'),
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton.icon(
                onPressed: () {
                  supabase.auth.signOut();
                  Navigator.pushNamed(context, "/login");
                  ;
                },
                icon: Icon(Icons.exit_to_app),
                label: Text('Logout'),
              ),
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
