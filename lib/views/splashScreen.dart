import 'dart:async';
import 'package:bipolar_test/views/InitializeProviderData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;

  void navigationPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => InitializeProviderData()));
  }

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween<double>(begin: 50, end: 150)
        .animate(new CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutCubic))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed)
          setState(() {});
      },
      );
    controller.forward();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: <Widget>[
        Container(
          color: const Color(0xFFFFFFFF),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Center(child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: animation.value,
          width: animation.value,
          child: Image.asset('assets/flutter_logo.png'),
        ),)
      ]),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}