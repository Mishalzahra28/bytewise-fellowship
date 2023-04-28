import 'package:flutter/material.dart';
import '../../../components/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(25.0)),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                  fillColor: Colors.grey.shade50,
                  filled: true,
                  hintText: 'Username',
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(25.0)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(25.0)),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                  fillColor: Colors.grey.shade50,
                  filled: true,
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                ),
              ),
            ),
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
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(45.0),
                  vertical: getProportionateScreenHeight(20.0)),
              margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(25.0)),
              decoration: BoxDecoration(
                color: Colors.orange.shade500,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "Login",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
