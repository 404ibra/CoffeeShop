import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page/service/auth_service.dart';
import 'package:page/utils/customColors.dart';
import 'package:page/utils/customTextStyle.dart';

import '../home_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String email, username, fullname, password;
  final formKey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
  final authService = AuthService();
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
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleText(),
                    customSizedBox(),
                    emailTextField(),
                    customSizedBox(),
                    passwordTextField(),
                    customSizedBox(),
                    usernameTextField(),
                    customSizedBox(),
                    fullnameTextField(),
                    customSizedBox(),
                    backTopLoginPage(),
                    signUpButton()
                  ],
                ),
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
          image:
              DecorationImage(image: AssetImage(topImage), fit: BoxFit.cover)),
    );
  }

//username ,password, username and fullname textfields...
  TextFormField emailTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Check your email";
        } else {}
      },
      onSaved: (value) {
        email = value!;
      },
      decoration: customInputDecoration("Email"),
    );
  }

  TextFormField usernameTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Check your username";
        } else {}
      },
      onSaved: (value) {
        username = value!;
      },
      decoration: customInputDecoration("Username"),
    );
  }

  TextFormField fullnameTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Check your Full Name";
        } else {}
      },
      onSaved: (value) {
        fullname = value!;
      },
      decoration: customInputDecoration("Full Name"),
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Check your password";
        } else {}
      },
      onSaved: (value) {
        password = value!;
      },
      obscureText: true,
      decoration: customInputDecoration("Password"),
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
  Center backTopLoginPage() {
    return Center(
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, "/loginPage"),
        child: Container(
          height: 50,
          width: 175,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xfffb98d58)),
          child: Center(
            child: Text(
              "Back Login Page",
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
        onPressed: signUp,
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

  void signUp() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final result =
          await authService.signUp(email, username, fullname, password);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
    } else {}
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
