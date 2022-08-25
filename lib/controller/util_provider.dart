import 'package:fire_on/controller/home_provider.dart';
import 'package:fire_on/controller/login_provider.dart';
import 'package:fire_on/controller/signup_provider.dart';
import 'package:fire_on/view/utilities/colors.dart';
import 'package:fire_on/view/utilities/temp_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UtilProvider extends ChangeNotifier {
  // here storing collection name
  String _collectionName = '';
  get collectionName => _collectionName;
  set collectionName(value) {
    _collectionName = value;
    notifyListeners();
  }

  // make text obscure for passwords
  bool _isObscure = false;
  get isObscure => _isObscure;
  set isObscure(value) {
    _isObscure = value;
    notifyListeners();
  }  

  // disposing variables
   void disposeVariables(ctx) {
    final signUpPro = Provider.of<SignUpProvider>(ctx, listen: false);
    final loginPro = Provider.of<LoginProvider>(ctx, listen: false);
    final homePro = Provider.of<HomeProvider>(ctx, listen: false);
    loginPro.emailControl.clear();
    loginPro.passwordControl.clear();
    signUpPro.nameControl.clear();
    signUpPro.emailControl.clear();
    signUpPro.passwordControl.clear();
    signUpPro.homeTownControl.clear();
    signUpPro.contactControl.clear();
    homePro.changeNameControl.clear();
    homePro.changeContactControl.clear();
    homePro.changeHomeTownControl.clear();    
    homePro.imagePath='';
    signUpPro.imageToString=tempImg;
    isObscure = false;
    notifyListeners();
  }

  // it will work if there is an error
  static showScaffoldMessege(ctx) {
    ScaffoldMessenger.of(ctx).showSnackBar(
      const SnackBar(
        content: Text(
          'Something went wrong',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: kRedColor,
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }  

  
  // it will work after successfull updation
  static showScaffoldMessegeAfterUpdate(ctx) {
    ScaffoldMessenger.of(ctx).showSnackBar(
      const SnackBar(
        content: Text(
          'Successfully updated',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }  

}
