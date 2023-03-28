import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'First App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Image.asset('lib/images/login.png'),
            ),
            const Text(
              'Welocme Back',
              style: TextStyle(color: Colors.white,
              fontSize: 20),
            ),
            const SizedBox(height: 25),

            Padding(
              padding:const EdgeInsets.symmetric(horizontal:25.0),
            child:TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:Colors.grey.shade100)
                ),
              fillColor:Colors.grey.shade50,
                filled:true,
                hintText: 'Username',
                hintStyle: TextStyle(color: Colors.grey.shade500),

              ),
            ),
            )   ,
            const SizedBox(height: 25),
            Padding(
              padding:const EdgeInsets.symmetric(horizontal:25.0),
            child:TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color:Colors.grey.shade100)
                ),
              fillColor:Colors.grey.shade50,
                filled:true,
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.grey.shade500),
              ),
            ),
            ),
           const  SizedBox(height:10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                  children:[Text("Forgot Password?",
              style: TextStyle(color: Colors.grey),
              ),
     ] ),
            ),
          const SizedBox(height: 15),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 45,vertical: 20),
            margin: EdgeInsets.symmetric(horizontal: 25),
            decoration:BoxDecoration(
              color: Colors.orange.shade500,
              borderRadius: BorderRadius.circular(8),
            ) ,
          child: Text("Login",
            style: TextStyle(color: Colors.white,
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
