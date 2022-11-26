import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page/utils/customColors.dart';
import 'package:page/utils/customTextStyle.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      //Normally  when we pressed textfield it gives an error because other texfields are closed but we added we can prevent this erro  r
      //  with SingleChildScrollView()...
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/image/topImage.png'),
                        fit: BoxFit.cover)),
              ),
              Container(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleText(),
                    customSizedBox(),
                    usernameTextField(),
                    customSizedBox(),
                    passwordTextField(),
                    customSizedBox(),
                    customButton("Login"),
                    customButton("Register"),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }


//username and password textfields...

  TextField passwordTextField() {
    return TextField(
      decoration: customInputDecoration("Password"),
    );
  }

  TextField emailTextField() {
    return TextField(
      decoration: 
      
      customInputDecoration("Username"),
    );
  }

// hi welcome text field...
  Text titleText() {
    return Text(
      ' Hi! \n Welcome',
      style: CustomTextStyle.titleTextStlye,
    );
  }

//custom button for signin signup and forgot ur password
  Center customButton(String textButton) {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: Container(
          height: 50,
          width: 175,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xfffb98d58)),
          child: Center(
            child: Text(
              textButton,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

//Login Page standart SizedBox height is 20...
  Widget customSizedBox() => SizedBox(
        height: 20,
      );

// For TextField Decoration...
  InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
        hintText: hintText,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
    );
  }
}
