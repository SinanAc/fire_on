import 'package:fire_on/controller/util_provider.dart';
import 'package:fire_on/controller/login_provider.dart';
import 'package:fire_on/view/utilities/box_deco.dart';
import 'package:fire_on/view/screens/signUp/signup_screen.dart';
import 'package:fire_on/view/widgets/elevated_button.dart';
import 'package:fire_on/view/screens/login/widgets/or_widget.dart';
import 'package:fire_on/view/screens/login/widgets/signup_button.dart';
import 'package:fire_on/view/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDeco.containerBoxDecoration(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 15, top: 80),
              child: SingleChildScrollView(
                child: Consumer<LoginProvider>(
                    builder: (context, loginProvider, _) {
                  return Column(
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Schyler'),
                      ),
                      const SizedBox(height: 140),
                      TextFieldWidget(
                        hintText: 'Email ID',
                        maxLen: 30,
                        control: loginProvider.emailControl,
                        icon: Icons.email_outlined,
                        isPassword: false,
                      ),
                      const SizedBox(height: 10),
                      TextFieldWidget(
                        hintText: 'Password',
                        maxLen: 8,
                        control: loginProvider.passwordControl,
                        icon: Icons.lock_outline,
                        isPassword: true,
                      ),
                      const SizedBox(height: 20),
                      if (loginProvider.isLoading == true)
                        const CircularProgressIndicator(),
                      if (loginProvider.isLoading == false)
                        ElevatedButtonWidget(
                          buttonName: 'Log in',
                          onTap: () {
                            loginProvider.logIn(context);
                          },
                        ),
                      const SizedBox(height: 20),
                      const OrWidget(),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SignUpButtonWidget(
                            size: 150,
                            svgPath: 'assets/Google__G__Logo.svg',
                            text: 'Signup with \nGoogle',
                            onTaps: () {},
                          ),
                          SignUpButtonWidget(
                            size: 150,
                            svgPath: 'assets/Firebase_Logo_Logomark.svg',
                            text: 'Create a new \nAccount',
                            onTaps: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen()))
                                  .then((value) {
                                Provider.of<UtilProvider>(context,
                                        listen: false)
                                    .disposeVariables(context);
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ));
  }
}
