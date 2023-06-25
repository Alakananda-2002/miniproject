import 'package:campus/pages/student_details_page.dart';
import 'package:flutter/material.dart';

class StudentHomePage extends StatelessWidget {
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          StudentDetailsPage(),
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
        title: Text('CampuX Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.push(context, _createRoute());
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CompanyList(),
            SizedBox(height: 20.0),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/news");
                },
                child: Text('New Updates'),
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/jobs");
                },
                child: Text('Job Notification'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CompanyList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CompanyListState();
}

class _CompanyListState extends State<CompanyList> {
  Widget Item(String name, String image) => Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 121, 121, 121).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        width: 150,
        height: 150,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.network(image),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          )
        ]),
      );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Text(
                  "Companies",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Item("IBM",
                    "https://zwscfjqqwjygfkyqzprm.supabase.co/storage/v1/object/public/mini/company/IBM"),
                Item("Infosys",
                    "https://zwscfjqqwjygfkyqzprm.supabase.co/storage/v1/object/public/mini/company/infosys")
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Item("Wipro",
                  "https://zwscfjqqwjygfkyqzprm.supabase.co/storage/v1/object/public/mini/company/wipro.png"),
              Item("TCS",
                  "https://zwscfjqqwjygfkyqzprm.supabase.co/storage/v1/object/public/mini/company/Tata_Consultancy_Services_Logo.svg.png")
            ],
          )
        ],
      )),
    );
  }
}
