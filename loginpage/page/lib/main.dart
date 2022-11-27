import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:page/pages/auth/login_page.dart';
import 'package:page/pages/auth/sign_up.dart';
import 'package:page/utils/customColors.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/loginPage" :(context) => LoginPage(),
        "/signUp" :(context) => SignUp(),

      },
      theme: ThemeData(
        scaffoldBackgroundColor: CustomColors.backgroundColor
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}