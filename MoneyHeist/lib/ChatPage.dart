import 'package:assignment_1/chat_widget.dart';
import 'package:flutter/material.dart';

import 'LargeText.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
              mySize: 35,
              myText: "Chats",
              myColor: Color.fromRGBO(81, 19, 103, 1),
              myFontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(children: const [
        MyChatWidget(
          chatIndex: 0,
        ),
        MyChatWidget(
          chatIndex: 1,
        ),
        MyChatWidget(
          chatIndex: 2,
        ),
        MyChatWidget(
          chatIndex: 3,
        ),
        MyChatWidget(
          chatIndex: 4,
        ),
        MyChatWidget(
          chatIndex: 5,
        ),
        MyChatWidget(
          chatIndex: 6,
        ),
        MyChatWidget(
          chatIndex: 7,
        ),
        MyChatWidget(
          chatIndex: 8,
        ),
        MyChatWidget(
          chatIndex: 9,
        ),
      ]),
    );
  }
}