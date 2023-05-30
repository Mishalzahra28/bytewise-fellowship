import 'package:flutter/material.dart';
import "../../utils/customField.dart";
import "../../utils/button.dart";

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _uName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Image.asset(
                "lib/assets/logo.png",
                width: 50,
                height: 50,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Create your account",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            CustomField(
              text: "Username",
              textController: _uName,
            ),
            CustomField(
              text: "Email",
              textController: _email,
            ),
            CustomField(
              text: "Password",
              textController: _password,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CustomBtn(text: "Signup", onBtnPressed: () {})],
            ),
          ],
        ),
      ),
    );
  }
}
