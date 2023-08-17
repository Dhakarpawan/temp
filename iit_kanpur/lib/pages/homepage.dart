import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iit_kanpur/Gymkhana/Music.dart';
import 'package:iit_kanpur/Gymkhana/Science.dart';
import 'package:iit_kanpur/pages/profile.dart';

import '../Gymkhana/Academics.dart';
import '../Gymkhana/Games.dart';
class HomePage extends StatelessWidget {
  final List<String> imageList = [
    'https://akm-img-a-in.tosshub.com/businesstoday/images/story/202104/iit_kanpur_660_070421124228.jpg?size=1200:675',
    'https://images.hindustantimes.com/img/2021/10/16/550x309/9d7d46f4-2aaa-11ec-a2ce-f0c64477ba97_1633967765802_1634357041739.jpg',
    'https://cdn.dnaindia.com/sites/default/files/styles/full/public/2020/12/15/943569-iit-kanpur-campus.jpg?im=Resize=(600,450)',
    // 'assets/images/4.png',
    // 'https://via.placeholder.com/300',
    // 'https://via.placeholder.com/300',
    // 'https://via.placeholder.com/300',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('IITK'),
        centerTitle: true,
        backgroundColor: Colors.grey,
        actions: <Widget>[
          IconButton(
              onPressed: (){
                Navigator.of(context)
                    .push(
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              },
              icon: const Icon(Icons.person_2_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
            itemCount: imageList.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Image.network(
                imageList[index],
                fit: BoxFit.cover,
              );
            },
            options: CarouselOptions(
              height: 200,
              enlargeCenterPage: false,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              pauseAutoPlayOnTouch: true,
              viewportFraction: 0.8,
            ),
          ),
          const SizedBox(height: 10,),
          Container(
            color: Colors.grey,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(width: 150,),
                Text(
                  'Welcome',
                  style: GoogleFonts.acme(
                    textStyle: TextStyle(fontSize: 35,),

                  ),
                ),

              ],

            ),
          ),
          Container(
            color: Colors.grey,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(width: 150,),
                Text(
                  'Campus Janta',
                  style: GoogleFonts.aleo(
                    textStyle: const TextStyle(fontSize: 20,),
                  ),
                ),

              ],

            ),
          ),
          const SizedBox(height: 10,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 180,
                width: 180,
                color: Colors.grey,
                child: IconButton(
                  icon: const Icon(Icons.sports_cricket,size: 120,),
                  onPressed: (){
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Games()),
                    );
                  },
                ),

              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 180,
                width: 180,
                color: Colors.grey,
                child: IconButton(
                  icon: const Icon(Icons.pending_actions_outlined,size: 120,),
                  onPressed: (){
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Academics()),
                    );
                  },
                ),

              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                height: 180,
                width: 180,
                color: Colors.grey,
                child: IconButton(
                  icon: const Icon(Icons.music_note,size: 120,),
                  onPressed: (){
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Music()),
                    );
                  },
                ),

              ),
              Container(
                margin: EdgeInsets.all(10),
                height: 180,
                width: 180,
                color: Colors.grey,
                child: IconButton(
                  icon: const Icon(Icons.science,size: 120,),
                  onPressed: (){
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Science()),
                    );
                  },
                ),

              ),
            ],
          ),
        ],
      ),


    );
  }
}
