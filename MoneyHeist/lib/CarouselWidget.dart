import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  final String carouselUrl;
  const CarouselWidget({super.key, required this.carouselUrl});

  @override
  Widget build(BuildContext context) {
    double pageHeight = MediaQuery.of(context).size.height;
    return Container(
      height: pageHeight / 2 * 1.1,
      width: pageHeight / 3 * 1.1,
      margin: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: AssetImage(
            carouselUrl,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}