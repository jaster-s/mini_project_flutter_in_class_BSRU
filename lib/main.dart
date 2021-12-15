import 'package:flutter/material.dart';
import 'package:news/auth/login.dart';
import 'package:news/auth/register.dart';
import 'package:news/auth/reset.dart';
import 'package:news/home/detail.dart';
import 'package:news/home/home.dart';
import 'package:news/home/more.dart';
import 'package:news/model/home_model.dart';
import 'package:news/splashscreenpage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashScreenPage.page,
      routes: {
        SplashScreenPage.page: (_) => SplashScreenPage(),
        LoginPage.page: (_) => LoginPage(),
        RegisterPage.page: (_) => RegisterPage(),
        HomePage.page: (_) => HomePage(),
        ResetScreen.page: (_) => ResetScreen()
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case MorePage.page:
            final homeie = settings.arguments as homei;
            return MaterialPageRoute(builder: (context) => MorePage(homeie));

          case ItemDetailPage.page:
            final Homeim = settings.arguments as homeim;
            return MaterialPageRoute(
                builder: (context) => ItemDetailPage(Homeim));
          default:
        }
      },
    );
  }
}

@override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Application Layout",
    home: HomePage(),
  );
}
