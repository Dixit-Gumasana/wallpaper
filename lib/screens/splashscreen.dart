import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'basescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Get.offAll(BaseScreen());

    });
    super.initState();
  }
  @override


  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: Get.height,
          width: Get.width,
          child: Image.asset("assets/splash.png",fit: BoxFit.cover),
        )


      ),
    );
  }
}
