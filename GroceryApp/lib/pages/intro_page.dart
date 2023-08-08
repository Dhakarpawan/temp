import 'package:flutter/material.dart';
import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          // Padding(
          //     padding: const EdgeInsets.only(left: 80,right: 80,  bottom: 40, top: 160),
          //   // child:
          //   child: Image.network(
          //     'https://media.istockphoto.com/id/1169639937/photo/vegetarian-thali-indian-appetizers-and-snacks-pakora-samosas-and-bhaji-served-with-chutneys.jpg?s=612x612&w=0&k=20&c=LjBe9pUDNIE2WXucU_45GZ8_QR0CBi_6Cgc4uIrgkLw=',
          //     height: 250,
          //     width: 400,
          //     fit: BoxFit.cover,
          //
          //   ),
          //
          // ),
          const Spacer(),
          const CircleAvatar(
            backgroundImage: NetworkImage('https://t4.ftcdn.net/jpg/00/46/69/89/360_F_46698983_uEWSRrkl4x7BcL2oxbxIlhUzaeTN1nQm.jpg'),

            radius: 110,

          ),

          const Padding(
              padding: const EdgeInsets.all(24.0),
            child: Text(
              "We deliver groceries at your doorstep",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Text(
              'Fresh Item Everyday',
            style: TextStyle(
              fontSize: 15,
            ),
          ),

          const Spacer(),

          GestureDetector(
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(12),

              ),
              padding: EdgeInsets.all(24.0),
              child: const Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),

              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
