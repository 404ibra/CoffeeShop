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
    String topImage = "assets/image/topImage.png";
    return Scaffold(
     
      //Normally  when we pressed textfield it gives an error because other texfields are closed but we added we can prevent this erro  r
      //  with SingleChildScrollView()...
      body: appBody(height, topImage),
    );
  }

  SingleChildScrollView appBody(double height, String topImage) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topImageContainer(height, topImage),
            Container(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleText(),
                  customSizedBox(),
                  emailTextField(),
                  customSizedBox(),
                  passwordTextField(),
                  customSizedBox(),
                  loginButton(),
                  signUpButton(),
                  forgotButton(),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Container topImageContainer(double height, String topImage) {
    return Container(
            height: height * 0.25,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(topImage),
                    fit: BoxFit.cover)),
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
      
      customInputDecoration("Email"),
    );
  }

// hi welcome text field...
  Text titleText() {
    MainAxisAlignment.start;
    return Text(
      ' Hi! \n Welcome',
      style: CustomTextStyle.titleTextStlye,
    );
  }

//custom button for login button signup and forgot ur password
  Center loginButton() {
    return Center(
      child: TextButton(
        onPressed: (){},
        child: Container(
          height: 50,
          width: 175,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xfffb98d58)),
          child: Center(
            child: Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
  Center signUpButton() {
    return Center(
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, "/signUp"),
        child: Container(
          height: 50,
          width: 175,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xfffb98d58)),
          child: Center(
            child: Text(
              "Sign Up",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
  
  Center forgotButton() {
    return Center(
      child: TextButton(
        onPressed: (){},
        child: Container(
          height: 50,
          width: 175,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xfffb98d58)),
          child: Center(
            child: Text(
              "Forgot Password",
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


//register button onpresseed

