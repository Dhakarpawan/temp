import 'package:assignment_1/CarouselWidget.dart';
import 'package:assignment_1/LargeText.dart';
import 'package:assignment_1/provider_list.dart';

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

class MyCarousel extends StatefulWidget {
  final int picIndex;
  const MyCarousel({super.key, required this.picIndex});

  @override
  State<MyCarousel> createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  List carouselUrls = [
    'assets/images/professor.webp', // 0
    'assets/images/lisbon.webp', // 1
    'assets/images/berlin.webp', // 2
    'assets/images/tokyo.jpeg', // 3
    'assets/images/rio.jpeg', // 4
    'assets/images/denver.jpeg', // 5
    'assets/images/Moscow.jpeg', // 6
    'assets/images/Nairobi.jpeg', // 7
    'assets/images/oslo.jpeg', // 8
    'assets/images/Helsinki.jpeg', // 9
  ];

  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: pageWidth / 18),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 224, 217, 238),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  CarouselWidget(carouselUrl: carouselUrls[widget.picIndex]),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const LargeText(
                          mySize: 25,
                          myText: "Download",
                          myColor: Color.fromRGBO(34, 38, 110, 1),
                          myFontWeight: FontWeight.bold),
                      LikeButton(
                        mainAxisAlignment: MainAxisAlignment.center,
                        size: 30,
                        onTap: (isLiked) async {
                          if (!context
                              .read<ListProvider>()
                              .favChats
                              .contains(widget.picIndex)) {
                            context
                                .read<ListProvider>()
                                .addToList(widget.picIndex);
                          } else {
                            context
                                .read<ListProvider>()
                                .removeFromList(widget.picIndex);
                          }
                          return !isLiked;
                        },
                        likeBuilder: (isLiked) {
                          return Icon(
                            context
                                    .read<ListProvider>()
                                    .favChats
                                    .contains(widget.picIndex)
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: context
                                    .read<ListProvider>()
                                    .favChats
                                    .contains(widget.picIndex)
                                ? Colors.pink
                                : Colors.black,
                            size: 30,
                          );
                        },
                      ),
                      LikeButton(
                        mainAxisAlignment: MainAxisAlignment.center,
                        size: 30,
                        likeBuilder: (isLiked) {
                          return Icon(
                            Icons.share,
                            color: isLiked ? Colors.blue : Colors.black,
                            size: 30,
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}