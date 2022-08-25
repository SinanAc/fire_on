import 'package:fire_on/controller/util_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    required this.hintText,
    required this.maxLen,
    required this.control,
    required this.icon,
    this.isPassword = false,
  }) : super(key: key);
  final String hintText;
  final int maxLen;
  final TextEditingController control;
  final IconData icon;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 58,
          width: 56,
          child: Card(
            color: const Color.fromARGB(255, 3, 55, 97),
            child: Icon(icon, size: 22, color: Colors.white),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 52,
            child: Consumer<UtilProvider>(builder: (context, authPro, _) {
              return TextField(
                controller: control,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    fillColor: Colors.grey[800],
                    filled: true,
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.3),
                    ),
                    counterText: '',
                    suffixIcon: isPassword
                        ? GestureDetector(
                            onTap: () {
                              authPro.isObscure == true
                                  ? Provider.of<UtilProvider>(context,
                                          listen: false)
                                      .isObscure = false
                                  : authPro.isObscure = true;
                            },
                            child: authPro.isObscure
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off))
                        : null),
                maxLength: maxLen,
                style: const TextStyle(color: Colors.white),
                obscureText: authPro.isObscure
                    ? false
                    : isPassword
                        ? true
                        : false,
              );
            }),
          ),
        ),
      ],
    );
  }
}
