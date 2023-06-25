import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HiringDetails extends StatefulWidget {
  const HiringDetails({super.key});

  @override
  State<HiringDetails> createState() => _HiringDetailsState();
}

class _HiringDetailsState extends State<HiringDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("mnefv"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              child: Text("kjerkhe"),
              onPressed: () => {launchUrl(Uri.parse("https://www.gmail.com"))},
            ),
            TextButton(
              child: Text("oiwrofuoi"),
              onPressed: () => {launchUrl(Uri.parse("https://www.gmail.com"))},
            ),
            TextButton(
              child: Text("oiw4t4rofuoi"),
              onPressed: () => {launchUrl(Uri.parse("https://www.gmail.com"))},
            )
          ],
        ),
      ),
    );
  }
}
