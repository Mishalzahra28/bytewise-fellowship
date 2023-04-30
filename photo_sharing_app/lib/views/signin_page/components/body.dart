import 'package:flutter/material.dart';
import 'package:photo_sharing_app/views/homepage/homepage.dart';
import '../../../components/size_config.dart';
import '../../../components/customButton.dart';
import '../../../components/customField.dart';
import '../../../components/errorDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => homePage()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showDialog(
            context: context,
            builder: (context) {
              return errorDialog(text: 'No user found for that email.');
            });
      } else if (e.code == 'wrong-password') {
        showDialog(
            context: context,
            builder: (context) {
              return errorDialog(
                  text: 'Wrong password provided \nfor that user.');
            });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: Image.asset(
                'lib/assets/login.png',
                height: getProportionateScreenHeight(300.0),
                width: getProportionateScreenWidth(300.0),
              ),
            ),
            const Text(
              'Welocme Back',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(25.0)),
              child: Form(
                child: Column(
                  children: [
                    SizedBox(height: getProportionateScreenHeight(25.0)),
                    customField(
                      text: 'Email',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      hidden: false,
                    ),
                    SizedBox(height: getProportionateScreenHeight(25.0)),
                    customField(
                      text: 'Password',
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      hidden: true,
                    ),
                    SizedBox(height: getProportionateScreenHeight(10.0)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "Forgot Password?",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ]),
                    SizedBox(height: getProportionateScreenHeight(15.0)),
                    customButton(text: 'Login', onClick: login)
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
