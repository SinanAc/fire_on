import 'dart:convert';
import 'package:fire_on/controller/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeImageWidget extends StatelessWidget {
  final String imagePath;
  const HomeImageWidget({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, value, child) => 
       GestureDetector(
        onTap: (){
          value.pickImage();
        },
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 110,
          backgroundImage: MemoryImage(
            const Base64Decoder().convert(
              value.imagePath.trim().isEmpty ? imagePath : value.imagePath
            ),
          ),
        ),
      ),
    );
  }
}
