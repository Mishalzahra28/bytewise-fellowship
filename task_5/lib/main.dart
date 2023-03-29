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
        primarySwatch: Colors.orange,
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
              'Welcome Back',
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade500),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>MainPage(),)
                );
              },
              child:  const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                  child: Text('Login')),

            ),
                    ],
        ),
      ),

    );
  }
}

class MainPage extends StatefulWidget {
  // const MainPage({super.key});
  // final String title;

  @override
  State<MainPage> createState() => MainPageState();
}

 class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
   backgroundColor: Colors.black,
     appBar: AppBar(
       title: const Text('Bookme',
           style: TextStyle(color: Colors.white,
           fontSize: 20,
           ),textAlign: TextAlign.center,
            ),
     ),
     body:Center(
       child:Column(
       children:[
         Expanded(
      child: Padding(
          padding:const EdgeInsets.symmetric(vertical:5.0),
         child:   Card(
           child: Column(
           children:[
           Image.asset('lib/images/service.png',
               height: 200,
               fit:BoxFit.fill  ),
                Text("Book Your Ride Now"),]
       ),
      )
       )
     ),
         Expanded(child: Row(
           children: [
             Expanded(child:
             Column(
              children:[
                Container(
                  height: 230,
                  child:
                  Padding(
                      padding:const EdgeInsets.symmetric(horizontal:5.0),
                    child: Card(
                       child: Column(
                          children:[
                        Image.asset('lib/images/book.png',
                     height: 200,
                     fit:BoxFit.fill  ),
                         Text("Book Seat",

                     style: TextStyle(fontSize: 18,
                     fontWeight: FontWeight.bold),
                     ),]
             ),
                    )
                  )

                ),
              ]
             )),
            Expanded(child:
            Column(
                 children:[
    Padding(padding:const EdgeInsets.symmetric(horizontal:5.0),

                   child:Card(
                     child: Column(
                         children:[
                           Image.asset('lib/images/buy.png',
                               // width: 300,
                               height: 200,
                               fit:BoxFit.fill  ),
                           Text("Buy Seat",
                             style: TextStyle(fontSize: 18,
                                 fontWeight: FontWeight.bold),),]
                     ),
                   )
                 ),
                 ]
             )
            )
           ],
         )
     ),
         Expanded(child: Row(
           children: [
             Expanded(child:
             Column(
                 children:[
                 Padding(padding:const EdgeInsets.symmetric(horizontal:5.0),
                   child:Card(
                   child: Column(
                       children:[
                         Image.asset('lib/images/wallet.png',
                             // width: 300,
                             height: 200,
                             fit:BoxFit.fill  ),
                         Text("My Wallet",
                           style: TextStyle(fontSize: 18,
                               fontWeight: FontWeight.bold),),]
                   ),
                 ),
                 )
                 ]
             )),
             Expanded(child:
             Column(
                 children:[
             Padding(padding:const EdgeInsets.symmetric(horizontal:5.0),
                   child:Card(
                     child: Column(
                         children:[
                           Image.asset('lib/images/refund.png',
                               // width: 300,
                               height: 200,
                               fit:BoxFit.fill  ),
                           Text("Refund",
                             style: TextStyle(fontSize: 18,
                                 fontWeight: FontWeight.bold),),]
                     ),
                 ),
             )
                 ]
             ))
           ],
         )
         )
    ] )
   )
   );
  }

 }