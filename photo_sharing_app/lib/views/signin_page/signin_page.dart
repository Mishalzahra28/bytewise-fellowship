import 'package:flutter/material.dart';
import '../../components/size_config.dart';
import 'components/body.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Photo Share"),
        ),
        backgroundColor: Colors.black,
        body: Body());
  }
}
