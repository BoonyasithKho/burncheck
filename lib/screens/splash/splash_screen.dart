import 'dart:async';

import 'package:burncheck/screens/splash/splash_component/shimertext.dart';
import 'package:burncheck/utils/my_asset.dart';
import 'package:burncheck/utils/my_constant.dart';
import 'package:burncheck/utils/my_textstyle.dart';
import 'package:burncheck/widgets/show_text.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required this.nextPage});

  final Widget nextPage;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int timeOut = 1500;
  int timeTransition = 250;
  int timeTextAnimation = 700;

  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: timeOut), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => widget.nextPage,
          transitionsBuilder: (_, animation, __, child) =>
              FadeTransition(opacity: animation, child: child),
          transitionDuration: Duration(milliseconds: timeTransition),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConstant.bgLightGrey2,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(MyAsset.logoApp, width: 110, height: 110),
              Padding(
                padding: EdgeInsetsGeometry.only(top: 14),
                child: ShowText(
                  title: MyConstant.appName,
                  textStyle: MyTextstyle.h1Red(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: ShimmerText(
                  text: 'Loading...',
                  textStyle: MyTextstyle.loading(),
                  textAnimation: timeTextAnimation,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
