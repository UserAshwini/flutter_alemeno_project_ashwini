import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_alememo_project/style/palette.dart';
import 'package:flutter_alememo_project/widget/custom_button.dart';

class PictureCaptureParams {
  final String text;
  final Icon buttonIcon;
  final File? image; 


  PictureCaptureParams( {this.image, required this.text, required this.buttonIcon});
}

Widget pictureCapture(BuildContext context,Function() ontap,{bool showImages = true,required PictureCaptureParams params}){
        double screenHeight = MediaQuery.of(context).size.height;

    return 
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: -screenHeight * 0.08,
                    left: 0,
                    right: 0,
                    child: Image.asset("assets/Smilodon.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: screenHeight * 0.2),
                    decoration: const BoxDecoration(
                        color: Palette.secondaryColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    child: Stack(
                        clipBehavior: Clip.none,
                        
                        alignment: AlignmentDirectional.center,
                        children: [
                          if (showImages)
                          Positioned(
                              top: screenHeight * 0.07,
                              child: Image.asset("assets/Corners.png")),
                              if (showImages)
                          Positioned(
                              top: screenHeight * 0.09,
                              child: Image.asset("assets/Cutlery.png")),
                          
                          Positioned(
                            top: screenHeight * 0.07,
                            child: GestureDetector(
                              onTap: ontap,
                              child:  CircleAvatar(
                                radius: 100,
                                backgroundColor: Palette.quaternarycolor,
                                backgroundImage:  params.image != null ? FileImage(params.image!) : null,
                              ),
                            ),
                          ),

                          Positioned(
                            bottom: screenHeight * 0.2,
                            child:  Text(
                              params.text,
                              style:const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Andika'),
                            ),
                          ),
                          Positioned(
                            bottom: screenHeight * 0.09,
                            child: CustomButton(
                              onPressed:  ontap,
                              icon: params.buttonIcon,
                            ),
                          )
                        ]),
                  ),
                ],
              ),
            );
            
  }