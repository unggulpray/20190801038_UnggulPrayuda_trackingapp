import 'dart:async';
import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import 'package:trackingapp/bloc/application_bloc.dart';
import 'package:trackingapp/pages/maps_screen.dart';
import 'package:trackingapp/pages/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}

class TrackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 200),
            SizedBox(
              height: 200,
              width: 300,
              child: Column(
                children: [
                  Lottie.asset('assets/lottie/rawat.json'),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return MapsScreen();
                          },
                        ),
                      );
                    },
                    child: Text("Tracking Now"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
