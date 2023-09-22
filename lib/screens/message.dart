import 'package:flutter/material.dart';
import 'package:flutter_alememo_project/style/palette.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("GOOD JOB", style: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w400,
        fontFamily: 'LilitaOne',
        color: Palette.primaryColor
      ),),),
    );
  }
}