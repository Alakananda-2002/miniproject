import 'package:campus/pages/home.dart';
import 'package:campus/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

var USER = null;
final supabase = Supabase.instance.client;

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://zwscfjqqwjygfkyqzprm.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inp3c2NmanFxd2p5Z2ZreXF6cHJtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODU3ODgxMjYsImV4cCI6MjAwMTM2NDEyNn0.T54cKNaHayDY5abH1xaVnekeCRIBKgD-WDZ9Bt9RF48',
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
                              const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10))),
                      child: const Text(
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
