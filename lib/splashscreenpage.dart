import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news/auth/login.dart';
import 'package:news/home/home.dart';

class SplashScreenPage extends StatefulWidget {
  static const String page = "splashscreen";
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  void init() async {
    await Firebase.initializeApp();

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      Navigator.popUntil(context, ModalRoute.withName(SplashScreenPage.page));

      if (user != null) {
        Navigator.pushNamed(context, HomePage.page);
      } else {
        Navigator.pushNamed(context, LoginPage.page);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: Container()));
  }
}
