import 'package:flutter/material.dart';
import 'package:flutter_alememo_project/widget/custom_button.dart';

Widget backArrow(BuildContext context){
    return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: CustomButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),]);
  }