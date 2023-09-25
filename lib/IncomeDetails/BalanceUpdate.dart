import 'dart:async';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String time = "";

   @override
  void initState() {
     Timer mytimer = Timer.periodic(Duration(days: 1), (timer) {
        DateTime timenow = DateTime.now();  //get current date and time
        time = timenow.hour.toString() + ":" + timenow.minute.toString() + ":" + timenow.second.toString(); 
        setState(() {
          
        });
        //mytimer.cancel() //to terminate this timer
     });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Test App",
        home: Scaffold(
        appBar: AppBar(
            title:Text("Execute Code With Timer"),
            backgroundColor: Colors.redAccent,
        ),
        body: Container(
          height: 260,
          color: Colors.red.shade50,
          child: Center(
            child: Text(time, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            //show time on UI
          )
        )
      )
    );
  }
}