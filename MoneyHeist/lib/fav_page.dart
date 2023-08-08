import 'package:assignment_1/chat_widget.dart';
import 'package:assignment_1/provider_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'LargeText.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  @override
  Widget build(BuildContext context) {
    List<int> favChats = context.read<ListProvider>().favChats;
    List<Widget> favWidget =
        favChats.map((e) => MyChatWidget(chatIndex: e)).toList();

    double pageHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: pageHeight / 10,
        backgroundColor: const Color.fromARGB(255, 211, 198, 237),
        elevation: 0,
        title: const Center(
          child: LargeText(
              mySize: 35,
              myText: "Liked",
              myColor: Color.fromRGBO(81, 19, 103, 1),
              myFontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(children: favWidget.toSet().toList()),
    );
  }
}