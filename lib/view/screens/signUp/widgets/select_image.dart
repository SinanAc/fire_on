import 'dart:convert';
import 'package:fire_on/controller/signup_provider.dart';
import 'package:fire_on/view/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpImageWidget extends StatelessWidget {
  const SignUpImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpProvider>(
      builder: (context, value, child) => Center(
        child: SizedBox(
          height: 105,
          width: 105,
          child: Stack(
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: [
              CircleAvatar(
                backgroundColor: kButtonColor,
                radius: 30,
                backgroundImage: MemoryImage(
                  const Base64Decoder().convert(value.imageToString),
                ),
              ),
              Positioned(
                bottom: 0,
                right: -30,
                child: RawMaterialButton(
                  onPressed: ()async {
                    await value.pickImage();
                  },
                  elevation: 4,
                  fillColor: Colors.grey,
                  padding: const EdgeInsets.all(6),
                  shape: const CircleBorder(),
                  child: const Icon(Icons.camera_alt_outlined),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



