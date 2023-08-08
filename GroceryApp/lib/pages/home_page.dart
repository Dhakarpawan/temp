import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/components/grocery_item_tile.dart';
import '';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),
            
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(('Good Morning,')),
            ),
            const SizedBox(height: 4,),
            
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Let's order for you",
                style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 24),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(),
            ),

            SizedBox(height: 24),

            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                  "Thali",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            
            Expanded(
                child: Consumer<CartModel>(
                  builder: (context, value, child){
                    return GridView.builder(
                        itemCount: value.shopItems.length,
                        gridDelegate: gridDelegate, itemBuilder: itemBuilder)
                  }
                )
            ),
          ],
        ),
      ),
    );
  }
}
