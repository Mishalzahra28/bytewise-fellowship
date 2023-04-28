import 'package:flutter/material.dart';
import 'package:photo_sharing_app/views/homepage/homepage.dart';
import '../../../components/size_config.dart';
import '../../../components/customButton.dart';
import '../../../components/customField.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void login() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => homePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
            SizedBox(height: getProportionateScreenHeight(25.0)),
            const customField(text: 'Username'),
            SizedBox(height: getProportionateScreenHeight(25.0)),
            const customField(text: 'Password'),
            SizedBox(height: getProportionateScreenHeight(10.0)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(25.0)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ]),
            ),
            SizedBox(height: getProportionateScreenHeight(15.0)),
            customButton(text: 'Login', onClick: login)
          ],
        ),
      ),
    );
  }
}
