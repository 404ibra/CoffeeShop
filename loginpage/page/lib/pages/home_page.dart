import 'package:flutter/material.dart';
import 'package:page/utils/customColors.dart';
import 'package:page/widgets/custom_text_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              "Home \nPage",
              style: TextStyle(
                  color: CustomColors.textHeadColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            CustomTextButton(onPressed: (){
              Navigator.pushReplacementNamed(context, "/loginPage");
            }, buttonText: "Back", textColor: CustomColors.buttonText)
          ],
        ),
      ),
    );
  }
}
