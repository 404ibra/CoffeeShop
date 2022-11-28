import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page/service/auth_service.dart';
import 'package:page/utils/customColors.dart';
import 'package:page/utils/customTextStyle.dart';
import 'package:page/widgets/custom_text_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email, password;
  final formkey = GlobalKey<FormState>();
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
                key: formkey,
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
                    CustomTextButton(
                        onPressed: () {
                          final result =  authService.signInAnonymous();
                          if (result != null) {
                            Navigator.pushReplacementNamed(context, "/homePage");
                          }else{
                            print("Have some problems..");
                          }
                        },
                        buttonText: "Guest",
                        textColor: CustomColors.buttonText)
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

//username and password textfields...

  TextFormField passwordTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Check your password.";
        } else {}
      },
      onSaved: (value) {
        password = value!;
      },
      obscureText: true,
      decoration: customInputDecoration("Password"),
    );
  }

  TextFormField emailTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Check your e-mail.";
        } else {}
      },
      onSaved: (value) {
        email = value!;
      },
      decoration: customInputDecoration("Email"),
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
        onPressed: login,
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

  void login() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      try {
        var userResult = await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        print(userResult.user!.email);
        Navigator.pushReplacementNamed(context, "/homePage");
      } catch (e) {
        print(e.toString());
      }
    } else {}
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
        onPressed: () {},
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
