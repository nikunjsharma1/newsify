import 'dart:async';

import 'package:flutter/material.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController mainController;
  late Animation mainAnimation;

  @override
  void initState() {
    mainController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    mainAnimation = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(mainController);
    mainController.forward();
    mainController.addListener(() {
      setState(() {});
    });
    Timer(
        Duration(milliseconds: 2300),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.receipt,
              size: 150,
              color: mainAnimation.value,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Newsify',
              style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'Poppins',
                  color: mainAnimation.value),
            ),
            Text(
              'For Stories That Matter.',
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  color: mainAnimation.value),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
