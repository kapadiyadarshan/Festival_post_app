import 'dart:async';

import 'package:festival_post/utils/routes_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ChangePage() {
    Timer.periodic(
      Duration(seconds: 4),
      (timer) {
        Navigator.of(context).pushReplacementNamed(MyRoutes.HomePage);
        timer.cancel();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    ChangePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 4,
              ),
              Image.asset(
                "assets/images/festival.gif",
                scale: 1.5,
              ),
              const Text(
                "Festival Post",
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              SpinKitFadingCircle(
                size: 56,
                color: Colors.orange,
              ),
              const Spacer(
                flex: 3,
              )
            ],
          )),
      backgroundColor: Colors.white,
    );
  }
}
