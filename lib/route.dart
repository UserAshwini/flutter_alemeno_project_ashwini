import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_alememo_project/screens/click_picture.dart';
import 'package:flutter_alememo_project/screens/home_screen.dart';
import 'package:flutter_alememo_project/screens/message.dart';
import 'package:flutter_alememo_project/screens/share_picture.dart';

class Routes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings,{File? foodImage}) {
    switch (settings.name) {
      case "/first":
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case "/second":
        return MaterialPageRoute(
          builder: (context) => const ClickPictureScreen(),
        );

      case "/third":
      final foodImage = settings.arguments as File?;
        return MaterialPageRoute(
          builder: (context) =>  SharePictureScreen(selectedImage: foodImage,),
        );

      case "/fourth":
        return MaterialPageRoute(
          builder: (context) => const MessageScreen(),
        );

      default:
        return null;
    }
  }
}
