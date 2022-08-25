import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpButtonWidget extends StatelessWidget {
  const SignUpButtonWidget(
      {Key? key,
      required this.size,
      required this.svgPath,
      required this.text,
      required this.onTaps})
      : super(key: key);
  final double size;
  final String svgPath;
  final String text;
  final Function onTaps;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          onTaps();
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(const Color.fromARGB(255, 7, 9, 39))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30, child: SvgPicture.asset(svgPath)),
            const SizedBox(height: 5),
            Text(
              text,
              style: const TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
