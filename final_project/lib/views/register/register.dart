import 'package:flutter/material.dart';
import "../../utils/customField.dart";
import "../../utils/button.dart";
import "../../services/authServices.dart";

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late String name;
  final _uNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void register() async {
    bool isValid = await AuthService.signUp(
        _uNameController.text, _emailController.text, _passwordController.text);
    if (isValid) {
      Navigator.pop(context);
    } else {
      print('Something went wrong');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              CustomField(
                text: "Username",
                textController: _uNameController,
              ),
              CustomField(
                text: "Email",
                textController: _emailController,
              ),
              CustomField(
                text: "Password",
                textController: _passwordController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CustomBtn(text: "Signup", onBtnPressed: register)],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
