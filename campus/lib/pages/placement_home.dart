import 'package:flutter/material.dart';

class PlacementOfficerHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Placement Officer Homepage'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Handle menu button press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/collage.png',
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Handle campus details button press
              },
              child: Text('Campus Details'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Handle student details button press
              },
              child: Text('Student Details'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Handle company details button press
              },
              child: Text('Company Details'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Handle training programs button press
              },
              child: Text('Training Programs'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Handle hiring details button press
              },
              child: Text('Hiring Details'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Handle rank list button press
              },
              child: Text('Rank List'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Handle packages button press
              },
              child: Text('Packages'),
            ),
          ],
        ),
      ),
    );
  }
}
