import 'dart:async';
import 'package:fire_on/view/utilities/box_deco.dart';
import 'package:fire_on/view/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 3), () {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      });
    });
    return Container(
        decoration: BoxDeco.containerBoxDecoration(),
        child: Center(
            child: SvgPicture.asset(
          'assets/Firebase_Logo_Logomark.svg',
          height: 60,
        )));
  }

}
