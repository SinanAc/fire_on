import 'package:fire_on/controller/signup_provider.dart';
import 'package:fire_on/view/utilities/box_deco.dart';
import 'package:fire_on/view/screens/signUp/widgets/select_image.dart';
import 'package:fire_on/view/widgets/elevated_button.dart';
import 'package:fire_on/view/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDeco.containerBoxDecoration(),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.only(left: 10, right: 15, top: 80),
            child: SingleChildScrollView(
              child: Consumer<SignUpProvider>(
                  builder: (context, signUpProvider, _) {
                return Column(
                  children: [
                    const Text(
                      'Create new Account',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Schyler'),
                    ),
                    const SizedBox(height: 30),
                    const SignUpImageWidget(),
                    const SizedBox(height: 25),
                    TextFieldWidget(
                      hintText: 'Name',
                      maxLen: 20,
                      control: signUpProvider.nameControl,
                      icon: Icons.person,
                    ),
                    const SizedBox(height: 10),
                    TextFieldWidget(
                      hintText: 'Home town',
                      maxLen: 20,
                      control: signUpProvider.homeTownControl,
                      icon: Icons.location_on_outlined,
                    ),
                    const SizedBox(height: 10),
                    TextFieldWidget(
                        hintText: 'Contact No',
                        maxLen: 10,
                        control: signUpProvider.contactControl,
                        icon: Icons.phone),
                    const SizedBox(height: 10),
                    TextFieldWidget(
                      hintText: 'Email ID',
                      maxLen: 30,
                      control: signUpProvider.emailControl,
                      icon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 10),
                    TextFieldWidget(
                      hintText: 'Password',
                      maxLen: 8,
                      control: signUpProvider.passwordControl,
                      icon: Icons.lock_outline,
                      isPassword: true,
                    ),
                    const SizedBox(height: 30),
                    if (signUpProvider.isLoading == true)
                      const CircularProgressIndicator(),
                    if (signUpProvider.isLoading == false)
                      ElevatedButtonWidget(
                          buttonName: 'Sign up',
                          onTap: () {
                            signUpProvider.signUp(context);
                          }),
                    const SizedBox(height: 20),
                  ],
                );
              }),
            ),
          ),
        ));
  }
}
