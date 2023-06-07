import 'package:campus/pages/placement_home.dart';
import 'package:campus/pages/student_details_page.dart';
import 'package:campus/pages/student_home.dart';
import 'package:campus/pages/student_profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../main.dart';
import 'company_home.dart';

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
        resizeToAvoidBottomInset: false,
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
                        USER = res.user;
                        if (session != null) {
                          final resp = await Supabase.instance.client
                              .from('role')
                              .select()
                              .eq("uuid",
                                  supabase.auth.currentSession?.user.id);
                          print(supabase.auth.currentSession?.user.id);
                          print(resp.toString());
                          role = resp[0]['role'];
                          if (role != null) {
                            (await SharedPreferences.getInstance())
                                .setString('role', role!);
                          }
                          if (context.mounted) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => role == "company"
                                        ? CompanyHomepage()
                                        : role == "student"
                                            ? StudentHomePage()
                                            : PlacementOfficerHomepage()));
                          }
                        } else {
                          showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                    content: Text("Eroor login"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("ok"))
                                    ],
                                  ));
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text("Login")),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Text(
                    "Don't have an account ? Sign up",
                    style: TextStyle(color: Colors.amber),
                  ))
            ],
          ),
        ));
  }
}
