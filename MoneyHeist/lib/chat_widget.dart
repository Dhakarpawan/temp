import 'package:flutter/material.dart';
import 'LargeText.dart';

class MyChatWidget extends StatelessWidget {
  final int chatIndex;
  const MyChatWidget({super.key, required this.chatIndex});

  @override
  Widget build(BuildContext context) {
    double pageHeight = MediaQuery.of(context).size.height;
    double pageWidth = MediaQuery.of(context).size.width;
    final chatNames = [
      "Professor", // 1
      "Lisbon", // 2
      "Berlin", // 3
      "Tokyo", // 4
      "Rio", // 5
      "Denver", // 6
      "Moscow", // 7
      "Nairobi", // 8
      'Oslo', // 9
      "Helsiniki" // 10
    ];
    final chatImgs = [
      'assets/images/dp_prof.jpeg',
      'assets/images/dp_lisbon.jpeg',
      'assets/images/dp_berlin.jpeg',
      'assets/images/dp_tokyo.jpeg',
      'assets/images/dp_rio.jpeg',
      'assets/images/dp_dennver.jpeg',
      'assets/images/dp_moscow.jpeg',
      'assets/images/dp_nairobi.jpeg',
      'assets/images/dp_oslo.jpeg',
      'assets/images/dp_helsiniki .jpeg'
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            height: pageHeight / 10 * 1.2,
            width: pageWidth * 0.95,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: const Color.fromARGB(255, 211, 198, 237),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(chatImgs[chatIndex]),
                  ),
                ),
                Align(
                    alignment: Alignment.center,
                    child: LargeText(
                        mySize: 24,
                        myText: chatNames[chatIndex],
                        myColor: const Color.fromRGBO(34, 38, 110, 1),
                        myFontWeight: FontWeight.bold)),
                const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.more_vert))
              ],
            ),
          ),
        ],
      ),
    );
  }
}