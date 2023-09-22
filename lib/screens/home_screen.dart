import 'package:flutter/material.dart';
import 'package:flutter_alememo_project/widget/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.78, 
              left: MediaQuery.of(context).size.width * 0.2,
            ),
            child: CustomButton(text: "Share Your meal", onPressed: () {
               Navigator.pushNamed(context, "/second");
            })),
      ),
    );
  }
}
