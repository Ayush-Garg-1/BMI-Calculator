import 'dart:async';

import 'package:bmi_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:bmi_app/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context)=>HomeScreen()
          )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(child: Text("BMI",style: TextStyle(
              fontSize: 100,
              fontWeight: FontWeight.bold,
              color: Colors.orange),
          )),
        ),
      ),
    );
  }
}
