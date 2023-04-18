import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import './dialog_box.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _pcontroller = TextEditingController();
  final _ucontroller = TextEditingController();
  final _logBox = Hive.box('logBox');
  // TodoDataBase db=TodoDataBase();

  void login() {
    var udata = _logBox.get('LOGDATA');
    var uname = udata[0];
    var upassword = udata[1];
    print(udata);
    print(uname);
    print(upassword);
    print(_ucontroller.text);
    print(_pcontroller.text);
    if (_ucontroller.text == uname && _pcontroller.text == upassword) {
      showDialog(
          context: context,
          builder: (context) {
            return Dialog_box(message: "Login Successful!");
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return Dialog_box(message: "Username or Password is incorrect");
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('lib/images/login.png'),
              const Text(
                'Welocme Back',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(height: 25),
              TextField(
                controller: _ucontroller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                  fillColor: Colors.grey.shade50,
                  filled: true,
                  hintText: 'Username',
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                ),
              ),
              const SizedBox(height: 25),
              TextField(
                controller: _pcontroller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                  fillColor: Colors.grey.shade50,
                  filled: true,
                  hintText: 'Password',
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: login,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, fixedSize: Size(150, 60)),
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
      ),
    );
  }
}
