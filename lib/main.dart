import 'package:flutter/material.dart';
import 'package:foodies/Screens/splash/SecondSplash.dart';
import 'package:foodies/Screens/splash/splash.dart';
import 'package:get/get.dart';
void main() {
  runApp(GetMaterialApp (
    initialRoute: '/',
    routes: {
       '/': (context) => Splash(),
       '/second': (context) => SecondSplash(),
    },

  )
  );
}