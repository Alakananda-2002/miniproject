import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CollegeDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('College Details'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Gover',
                style: TextStyle(fontSize: 24),
              ),
              Image.network(
                  "https://cdn.sstatic.net/Img/teams/teams-illo-free-sidebar-promo.svg"),
              SizedBox(height: 20),
              Text(
                'Location: City ABC',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Programs Offered: Computer Science, Mathematics, Economics',
                style: TextStyle(fontSize: 18),
              ),
              TextButton(
                  onPressed: () {
                    launchUrl(Uri.parse("https://www.gecidukki.ac.in"));
                  },
                  child: Text("www.jefnfr"))
            ],
          ),
        ));
  }
}
