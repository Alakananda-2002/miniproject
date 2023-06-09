import 'package:campus/pages/collage_details.dart';
import 'package:campus/pages/detailsofcomp.dart';
import 'package:campus/pages/hiring.dart';
import 'package:campus/pages/packages.dart';
import 'package:campus/pages/placement_profile.dart';
import 'package:campus/pages/placent_student_details.dart';
import 'package:campus/pages/ranklist.dart';
import 'package:campus/pages/training.dart';
import 'package:flutter/material.dart';

class PlacementOfficerHomepage extends StatelessWidget {
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          PlacementOfficerPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Placement Officer Homepage'),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Navigator.push(context, _createRoute());
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
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => CollegeDetailsPage()));
                  // Handle campus details button press
                },
                child: Text('Campus Details'),
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  // Handle student details button press
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => PlacementStudentDetails()));
                },
                child: Text('Student Details'),
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => CompDetails()));
                  // Handle company details button press
                },
                child: Text('Company Details'),
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (ctx) => HomePage()));

                  // Handle training programs button press
                },
                child: Text('Training Programs'),
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => HiringDetails()));
                  // Handle hiring details button press
                },
                child: Text('Hiring Details'),
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => RankListPage()));
                  // Handle rank list button press
                },
                child: Text('Rank List'),
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => PackagesPage(
                                packages: PackagesButton.packages,
                              )));
                  // Handle packages button press
                },
                child: Text('Packages'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
