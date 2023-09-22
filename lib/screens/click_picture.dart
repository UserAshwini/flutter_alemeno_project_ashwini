import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_alememo_project/widget/common_widget/back_arrow.dart';
import 'package:flutter_alememo_project/widget/common_widget/picture_capture.dart';
import 'package:image_picker/image_picker.dart';

class ClickPictureScreen extends StatefulWidget {
  const ClickPictureScreen({super.key});

  @override
  State<ClickPictureScreen> createState() => _ClickPictureScreenState();
}

class _ClickPictureScreenState extends State<ClickPictureScreen> {
  File? foodImage;
  @override
  Widget build(BuildContext context) {
    PictureCaptureParams params = PictureCaptureParams(
        image: foodImage,
        text: 'Click your meal',
        buttonIcon: const Icon(Icons.camera_alt_rounded));
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          backArrow(context),
          if (foodImage == null)
            pictureCapture(
              params: params,
              context,
              () async {
                XFile? selectedImage =
                    await ImagePicker().pickImage(source: ImageSource.camera);

                if (selectedImage != null) {
                  File convertedFile = File(selectedImage.path);
                  setState(() {
                    foodImage = convertedFile;
                  });

                  Navigator.pushNamed(context, "/third", arguments: foodImage);
                } else {}
              },
            ),
        ],
      )),
    );
  }
}
