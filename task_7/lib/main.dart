import 'package:flutter/material.dart';

List<Color> colors=[
  Colors.black87,
  Colors.deepPurple,
  Colors.orange,
  Colors.greenAccent,
  Colors.redAccent
];
void main(){

  runApp(MaterialApp(
    home:GestureApp()
  ));
}


class GestureApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> GestureAppState();

}

class GestureAppState  extends State<StatefulWidget>{
  int num=0;
  int num1=0;
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar:AppBar(
          backgroundColor: Colors.black87,
          title:Text('Gesture Detector')
      ),
      body:Align(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                   child:GestureDetector(
                      onTap:(){
                      setState(() {
                        num++;
                              });
                        },
                    child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color:Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.all(Radius.circular(10)),

                    ),
                    child: Align(
                        child:Text('$num',
                          style: TextStyle(color: Colors.white, fontSize: 38),)
                    ),
                  ),
                 )
                ), Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:GestureDetector(
                      onTap:(){
                       setState(() {
                       num1++;
                      });
                      },
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color:colors[num1%5],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),

                    child: Align(
                        child:Text('Tap',
                          style: TextStyle(color: Colors.white, fontSize: 23),)
                    ),
                  ),
                ),
                ),
              ],
            ),
          )
      // )
  );

  }

}