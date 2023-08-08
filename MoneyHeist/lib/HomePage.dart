import 'LargeText.dart';
import 'StatefulCarousel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List carouselUrls = [
    'assets/images/professor.webp', // 0
    'assets/images/berlin.webp', // 1
    'assets/images/tokyo.jpeg', // 2
    'assets/images/denver.jpeg', // 3
    'assets/images/rio.jpeg', // 4
    'assets/images/Moscow.jpeg', // 5
    'assets/images/Helsinki.jpeg', // 6
    'assets/images/oslo.jpeg', // 7
    'assets/images/Nairobi.jpeg', // 8
    'assets/images/lisbon.webp' // 9
  ];
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
                mySize: 32,
                myText: "Money Heist",
                myColor: Color.fromRGBO(81, 19, 103, 1),
                myFontWeight: FontWeight.bold),
          ),
          //leading: ,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu,
                    color: Color.fromRGBO(81, 19, 103, 1)),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        body: ListView(children: [
          CarouselSlider(
            //Slider Container properties
            options: CarouselOptions(
              height: pageHeight * 2 / 3 * 1.2,
              enlargeCenterPage: true,
              autoPlay: false,
              aspectRatio: 9 / 16,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
            items: const [
              MyCarousel(picIndex: 0),
              MyCarousel(picIndex: 1),
              MyCarousel(picIndex: 2),
              MyCarousel(picIndex: 3),
              MyCarousel(picIndex: 4),
              MyCarousel(picIndex: 5),
              MyCarousel(picIndex: 6),
              MyCarousel(picIndex: 7),
              MyCarousel(picIndex: 8),
              MyCarousel(picIndex: 9),
            ],
          )
        ]));
  }
}