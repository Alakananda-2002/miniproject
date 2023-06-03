import 'package:campus/pages/home.dart';
import 'package:campus/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

var USER = null;
final supabase = Supabase.instance.client;

Future<void> main() async {
  await Supabase.initialize(
    url: '',
    anonKey: '',
  );

  final Session? session = supabase.auth.currentSession;

  runApp(MaterialApp(
    routes: {"/login": (ctx) => Login(), "/home": (ctx) => Home()},
    home: (session == null ? const MyApp() : Home()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/logo.png"),
              ],
            ),
          ),
          Positioned(
              bottom: 50,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.white),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10))),
                      child: Text(
                        "Get Started",
                        style: TextStyle(fontSize: 28, color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/login');
                      },
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
