import 'package:flutter/material.dart';
import 'package:news/auth/auth_controller.dart';
import 'package:news/auth/register.dart';
import 'package:news/auth/reset.dart';

class LoginPage extends StatefulWidget {
  static const String page = "login";
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController authController = AuthController();

  final GlobalKey formkey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final passController = TextEditingController();

  void onLogin() {
    authController.onLogin(userController.text, passController.text);
  }



  void toRegister() {
    Navigator.pushNamed(context, RegisterPage.page);
  }

  void toReset() {
    Navigator.pushNamed(context, ResetScreen.page);
  }

  @override
  void dispose() {
    userController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      body: Padding(
        padding: const EdgeInsets.only(left: 40.0, right: 40.0),
        child: SafeArea(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Center(
                child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/588-hospital.svg/1200px-588-hospital.svg.png',
                    width: 200)),
          ),
          Form(
            key: formkey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "เข้าสู่ระบบ",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 500,
                    child: TextFormField(
                      validator: (String? message) {
                        return message == null || message.length < 5
                            ? "ต้องใส่มากกว่า 5 ตัวอักษร"
                            : null;
                      },
                      controller: userController,
                      decoration: InputDecoration(
                          hintText: "ชื่อผู้ใชงาน",
                          label: Text("กรอกชื่อผู้ใช้งาน")),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 500,
                    child: TextFormField(
                      controller: passController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "รหัสผ่าน", label: Text("กรอก รหัสผ่าน")),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1),
            child: Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                    onPressed: toReset,
                    child: Text(
                      "ลืมรหัสผ่าน",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: SizedBox(
                  width: 100,
                  child: ElevatedButton(
                      onPressed: onLogin, child: Text("เข้าสู่ระบบ"))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: toRegister,
                    child: Text(
                      "สมัครสมาชิก",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))),
          )
        ])),
      ),
    );
  }
}
