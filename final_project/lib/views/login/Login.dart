import 'package:flutter/material.dart';
import "../../services/authServices.dart";
import "../../utils/customField.dart";
import "../../utils/button.dart";
import "../../utils/errorDialog.dart";
import "../../utils/dialogBox.dart";
import "../register/register.dart";
import '../../services/Models/Activity.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void login() async {
    bool isValid = await AuthService.Login(
        _emailController.text, _passwordController.text);
    if (isValid) {
      Navigator.pop(context);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return errorDialog(text: 'Email or password is incorrect');
          });
    }
  }

  void reset() async {
    bool isValid = await AuthService.resetPassword(_emailController.text);
    if (isValid) {
      showDialog(
          context: context,
          builder: (context) {
            return DialogBox(text: 'Password reset email sent successfuly');
          });
    } else {
      print("something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: SingleChildScrollView(
        child: Padding(
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
                text: "Email",
                textController: _emailController,
              ),
              CustomField(
                text: "Password",
                textController: _passwordController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CustomBtn(text: "Log in", onBtnPressed: login)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: reset,
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.blue),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register()));
                      },
                      child: const Text(
                        "Sign up for Twitter",
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              )
            ],
          ),
        ),
        // ),
      ),
    );
  }
}
