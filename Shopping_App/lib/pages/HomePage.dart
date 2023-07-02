import 'package:flutter/material.dart';
import 'package:shop/pages/HomeAppBar.dart';
class HomePage extends StatelessWidget {
  // const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [

          HomeAppBar(),
          Spacer(),
          Container(
            height: 300,
            padding: EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),

            ),
            child: Column(children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                ),

                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      height: 50,
                      width: 300,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search here..."
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.camera_alt,
                      size: 27,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                    ),
                  child: const Text(
                    "Categories",
                    style: TextStyle(
                        fontSize: 25,
                       fontWeight: FontWeight.bold,
                     ),
                  ),
                ),
                  Spacer(),
                  const Icon(
                    Icons.grid_view,
                    size: 27,
                  ),
                ],
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(

                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35),
                          image: DecorationImage(
                            image: NetworkImage('https://www.marshallheadphones.com/dw/image/v2/BCQL_PRD/on/demandware.static/-/Sites-zs-master-catalog/default/dw1394819b/images/marshall/headphones/monitor-ii-anc/large/mh-monitor-II-ANC-large-1.png'),
                            fit: BoxFit.cover,
                          ),

                        ),

                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35),
                          image: const DecorationImage(
                            image: NetworkImage('https://m.media-amazon.com/images/I/71fAjuDqbdL.jpg'),
                            fit: BoxFit.cover,

                          ),
                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35),
                          image: const DecorationImage(
                            image: NetworkImage('https://proaudiovideo.in/wp-content/uploads/2022/06/Marshall-Minor-III-True-Wireless-In-Ear-Headphones-Online-Buy-Mumbai-India_1.jpg'),
                            fit: BoxFit.cover,
                          ),

                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35),
                        ),

                      ),
                    ),
                  ],
                ),
              )


            ],
            ),
          ),



        ],
      ),
    );
  }
}
