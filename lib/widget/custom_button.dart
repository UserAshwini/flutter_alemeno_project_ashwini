import 'package:flutter/material.dart';
import 'package:flutter_alememo_project/style/palette.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Icon? icon;
  final Function() onPressed;
  final double? iconSize; 
  final Color? iconColor;

  CustomButton({
    this.text,
    this.icon,
    required this.onPressed,  
    this.iconSize = 40, 
     this.iconColor = Palette.tertiaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Palette.primaryColor,
          borderRadius: BorderRadius.circular( 30.0), 
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (icon != null) ...[
              ClipOval(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Icon(
                    icon!.icon,
                    size: iconSize,
                    color: iconColor,
                  ),
                ),
              ),
              if (text != null) Text(text!),
            ] else if (text != null) ...[
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Text(text!,
                  style: const TextStyle(
                    fontFamily: 'Andika',
                    color: Palette.tertiaryColor,
                    fontSize: 25
                  ),)),
            ],
          ],
        ),
      ),
    );
  }
}
