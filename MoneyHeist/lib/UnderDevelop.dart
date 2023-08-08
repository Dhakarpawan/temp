import 'LargeText.dart';
import 'package:flutter/material.dart';

class UnderDevelop extends StatefulWidget {
  const UnderDevelop({super.key});

  @override
  State<UnderDevelop> createState() => _UnderDevelopState();
}

class _UnderDevelopState extends State<UnderDevelop> {
  @override
  Widget build(BuildContext context) {
    double pageHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: pageHeight / 10,
          backgroundColor: const Color.fromARGB(255, 211, 198, 237),
          elevation: 0,
          title: const Center(
            child: LargeText(
                mySize: 30,
                myText: "Work in Progress",
                myColor: Color.fromRGBO(81, 19, 103, 1),
                myFontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LargeText(
                mySize: 30,
                myText: 'Still Under\nDevelopent',
                myColor: Color.fromRGBO(85, 30, 104, 1),
                myFontWeight: FontWeight.bold),
            const SizedBox(height: 30),
            Image.asset(
              'assets/Advanced customization-amico.png',
              alignment: Alignment.center,
            ),
            const SizedBox(height: 30),
          ],
        ));
  }
}