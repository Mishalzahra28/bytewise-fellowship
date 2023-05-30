import 'package:flutter/material.dart';
import "../../utils/customField.dart";
import "../../utils/button.dart";

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _uName = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Image.asset(
                "lib/assets/logo.png",
                width: 100,
                height: 100,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Log in to Twitter",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            CustomField(
              text: "Username",
              textController: _uName,
            ),
            CustomField(
              text: "Password",
              textController: _password,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CustomBtn(text: "Log in", onBtnPressed: () {})],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.blue),
                    )),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Sign up for Twitter",
                      style: TextStyle(color: Colors.blue),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
