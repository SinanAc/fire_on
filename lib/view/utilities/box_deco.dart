import 'package:flutter/material.dart';

class BoxDeco {
  static containerBoxDecoration(){
    return
    const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromARGB(255, 17, 27, 88),
              Color.fromARGB(255, 19, 18, 18)
            ]));
  }
}