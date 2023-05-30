import 'package:flutter/material.dart';
import "../../utils/button.dart";
import "../login/Login.dart";
import '../register/register.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    "lib/assets/logo.png",
                    height: 200,
                    width: 200,
                  ),
                ),
                const Text("See whats happening around the world right now.",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
              ],
            ),
            const SizedBox(
              height: 150,
            ),
            Column(
              children: [
                CustomBtn(
                    text: "Login",
                    onBtnPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    }),
                CustomBtn(
                    text: "Create account",
                    onBtnPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register()));
                    })
              ],
            )
          ],
        ),
      ),
    ));
  }
}
