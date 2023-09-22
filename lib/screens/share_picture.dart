import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_alememo_project/style/palette.dart';
import 'package:flutter_alememo_project/widget/common_widget/back_arrow.dart';
import 'package:flutter_alememo_project/widget/common_widget/picture_capture.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class SharePictureScreen extends StatefulWidget {
  final File? selectedImage;
  const SharePictureScreen({super.key, this.selectedImage});

  @override
  State<SharePictureScreen> createState() => _SharePictureScreenState();
}

class _SharePictureScreenState extends State<SharePictureScreen> {
  bool isUploading = false;

  void uploadImageToFirebase() async {
    try {
      // store file in firebase
      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child("foodImages")
          .child(const Uuid().v1())
          .putFile(widget.selectedImage!);

      TaskSnapshot taskSnapshot = await uploadTask;

      // Check if the upload task is complete and successful
      if (taskSnapshot.state == TaskState.success) {
        String downloadUrl = await taskSnapshot.ref.getDownloadURL();
        print('Image uploaded successfully. Download URL: $downloadUrl');
      } else {
        // print('Image upload failed.');
      }
    } catch (e) {
      // print('Error uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    PictureCaptureParams params = PictureCaptureParams(
      image: widget.selectedImage,
      text: 'Will you eat this?',
      buttonIcon: const Icon(Icons.done),
    );
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          backArrow(context),
          pictureCapture(params: params, context, () {
            setState(() {
              uploadImageToFirebase();
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text(
                        "Uploaded Successfully!",
                        style: TextStyle(
                            fontFamily: 'LilitaOne',
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Palette.primaryColor),
                      ),
                      content: const Text(
                        "Thank you for sharing food with me",
                        style: TextStyle(
                            fontFamily: 'LilitaOne',
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/fourth");
                            },
                            child: const Text(
                              "OK",
                              style: TextStyle(
                                  fontFamily: 'LilitaOne',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Palette.primaryColor),
                            ))
                      ],
                    );
                  });
            });
          }, showImages: false),
        ],
      )),
    );
  }
}
