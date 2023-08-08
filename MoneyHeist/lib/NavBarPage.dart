import 'package:flutter/material.dart';
import 'ChatPage.dart';
import 'HomePage.dart';
import 'package:assignment_1/UnderDevelop.dart';
import 'package:assignment_1/fav_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key});

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  int _selectedindex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  List pages = [
    const HomePage(),
    const ChatPage(),
    const FavPage(),
    const UnderDevelop()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedindex],
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 235, 235, 246),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: GNav(
              selectedIndex: _selectedindex,
              onTabChange: _navigateBottomBar,
              backgroundColor: const Color.fromRGBO(255, 235, 235, 246),
              gap: 8,
              activeColor: const Color.fromRGBO(34, 38, 110, 1),
              tabBackgroundColor: const Color.fromARGB(255, 211, 198, 237),
              tabs: const [
                GButton(icon: Icons.home,text: "Home",),
                GButton(icon: Icons.chat_bubble_outline_rounded, text: "Chats"),
                GButton(icon: Icons.favorite_border_outlined,text: "Likes",),
                GButton(icon: Icons.settings, text: 'Settings'),
              ]),
        ),
      ),
    );
  }
}