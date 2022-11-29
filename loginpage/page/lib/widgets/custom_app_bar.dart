// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key,required this.title,}): preferredSize = const Size.fromHeight(56.0), super(key: key);
  final Size preferredSize;
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        Icon(Icons.add),
        Icon(Icons.favorite),
        Icon(Icons.message_outlined),
      ],
    );
  }
}
