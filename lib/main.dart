import 'dart:async';

import 'package:Battery_level/screen/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  void initState() {
    Timer(Duration(seconds: 5),()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>BottomBarScreen())));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 100,
                        decoration: BoxDecoration(
                          // color: Colors.redAccent,
                            image: DecorationImage(
                                image: AssetImage('assets/images/splash.png')
                            )
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                        'Online App made by Ahmad Al hariri'
                      ),
                    SizedBox(height: 20,),
                    CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
