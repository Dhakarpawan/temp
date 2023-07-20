import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop/pages/Loginweb.dart';

import '../Animations.dart';

class Successful extends StatefulWidget {
  const Successful({super.key});

  @override
  State<Successful> createState() => _SuccessfulState();
}

class _SuccessfulState extends State<Successful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset(
          "lib/assets/Auth_animation.json",
          onLoaded: (composition) {
            // Add a delay after the animation completes
            Future.delayed(const Duration(milliseconds: 2500), () {
              // Navigate to the next page after the animation is complete
              Navigator.pushReplacement(
                context,
                FadeRoute(page: const LoginWeb()),
              );
            });
          },
        ),
      ),
    );
  }
}
