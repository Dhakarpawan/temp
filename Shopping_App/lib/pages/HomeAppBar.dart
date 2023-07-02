import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Icon(
            Icons.sort,
            size: 30,
          ),
          Padding(
              padding: EdgeInsets.only(left: 125),
            child: Text(
              "Audio",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Spacer(),
          Badge(
            backgroundColor: Colors.red,
            padding: EdgeInsets.all(7),
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 30,

              ),
            ),

          ),

        ],
      ) ,
    );
  }
}
