import 'package:flutter/material.dart';
import 'package:shop/pages/Loginweb.dart';

import '../Animations.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context, FadeRoute(page: LoginWeb()));
            },
            child: const Icon(
              Icons.sort,
              size: 30,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 125),
            child: Text(
              "Audio",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          Badge(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.all(7),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.shopping_bag_outlined,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
