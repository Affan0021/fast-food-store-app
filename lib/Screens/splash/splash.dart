import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:foodies/Screens/splash/SecondSplash.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 15),
            ()=> Get.to(SecondSplash())
        );

  }
  @override
  Widget build(BuildContext context) {
    return Container(

      alignment: Alignment.center,
      color: Colors.black,
      child: Image.asset(
        'assets/logo.png',

      ),


    );
  }
}
