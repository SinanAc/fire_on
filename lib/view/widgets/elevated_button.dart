import 'package:fire_on/view/utilities/colors.dart';
import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget(
      {Key? key, 
      required this.buttonName,
      required this.onTap,
      this.isHome=false
      })
      : super(key: key);
  final String buttonName;
  final Function onTap;
  final bool isHome;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: ElevatedButton(
            onPressed: () {
               onTap();
            },
            style: ElevatedButton.styleFrom(
                primary:isHome? kIndigoColor: kButtonColor),
            child: Text(buttonName,
                style: const TextStyle(fontSize: 17, color: Colors.white)),
          ),
        ));
  }
}
