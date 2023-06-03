import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../main.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _uname = TextEditingController(text: "");
  TextEditingController _pass = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(child: Image.asset("assets/logo.png")),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Welcome",
              style: TextStyle(fontSize: 30),
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                controller: _uname,
                decoration: const InputDecoration(hintText: "username"),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: _pass,
                  decoration: const InputDecoration(hintText: "passsword"),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: ElevatedButton(
                onPressed: () async {
                  try {
                    String username = _uname.text;
                    String passsword = _pass.text;
                    final AuthResponse res =
                        await supabase.auth.signInWithPassword(
                      email: username,
                      password: passsword,
                    );
                    final Session? session = res.session;

                    final User? user = res.user;
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text("Login")),
          )
        ],
      ),
    ));
  }
}
