// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    required this.textColor,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String buttonText;
  final Color textColor;


  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Container(
          height: 50,
          width: 175,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xfffb98d58)),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(color: textColor),
            ),
          ),
        ),
      );
  }
}
