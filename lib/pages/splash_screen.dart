import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:trackingapp/main.dart';
import 'package:trackingapp/pages/introduction_screen.dart';

class _SplashScreen extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Introduction(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              SizedBox(
                height: 200,
                width: 200,
                child: Lottie.asset('assets/lottie/area-map.json'),
              ),
              Text(
                "TRACKING COVID-19",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "SERVICES",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreen createState() => new _SplashScreen();
}
