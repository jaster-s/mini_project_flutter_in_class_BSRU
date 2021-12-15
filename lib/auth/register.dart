import 'package:flutter/material.dart';
import 'package:news/auth/auth_controller.dart';
import 'package:news/auth/login.dart';
import 'package:news/model/user_model.dart';



class RegisterPage extends StatefulWidget {
  static const String page = "register";
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthController authController = AuthController();
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final passsController = TextEditingController();

  void toLogin() {
    Navigator.pushNamed(context, LoginPage.page);
  }

  void _onRegister() {
    UserModel userModel = UserModel(
      username: userController.text,
      email: emailController.text,
      password: passController.text,
    );
    authController.onRegister(userModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      body: Padding(
        padding: const EdgeInsets.only(left: 40.0, right: 40.0),
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Container(
                child: Text(
                  "สมัครสมาชิก",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: 500,
                child: TextField(
                  controller: userController,
                  decoration: InputDecoration(hintText: "ชื่อผู้ใช้งาน"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: 500,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(hintText: "อิเมล์"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: 500,
                child: TextField(
                  controller: passController,
                  obscureText: true,
                  decoration: InputDecoration(hintText: "รหัสผ่าน"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: 500,
                child: TextField(
                  controller: passsController,
                  obscureText: true,
                  decoration: InputDecoration(hintText: "ยืนยันรหัสผ่าน"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 15),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                      onPressed: toLogin,
                      child: Text(
                        "ย้อนกลับ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))),
            ),
            ElevatedButton(onPressed:_onRegister, child: const Text("สมัครสมาชิก")),
          ],
        )),
      ),
    );
  }
}
