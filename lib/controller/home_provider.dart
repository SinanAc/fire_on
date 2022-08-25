import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_on/controller/util_provider.dart';
import 'package:fire_on/view/utilities/colors.dart';
import 'package:fire_on/view/screens/splash/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HomeProvider extends ChangeNotifier {
  // textfield controllers
  final changeNameControl = TextEditingController();
  final changeHomeTownControl = TextEditingController();
  final changeContactControl = TextEditingController();

  //is loading or not
  bool isLoading = false;
  // logout function
  void logOut(context) async {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text(
              'Logout !!',
              style: TextStyle(color: kRedColor),
            ),
            content: const Text('Are you sure to want to logout?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text(
                  'No',
                  style: TextStyle(
                      color: kButtonColor, fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Provider.of<UtilProvider>(context, listen: false)
                        .disposeVariables(context);
                  }).then((value) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const SplashScreen()),
                        (route) => false);
                  });
                },
                child: const Text('Yes',
                    style: TextStyle(
                        color: kRedColor, fontWeight: FontWeight.bold)),
              ),
            ],
          );
        });
  }

  // update function
  updateUserData({
    required String email,
    required String name,
    required String homeTown,
    required String contactNo,
    required String image,
    required String documentID,
    required context,
  }) async {
    isLoading = true;
    notifyListeners();
    if (name.isEmpty ||
        homeTown.isEmpty ||
        contactNo.isEmpty ||
        contactNo.length < 10) {
      isLoading = false;
      notifyListeners();
      return UtilProvider.showScaffoldMessege(context);
    }
    isLoading = true;
    notifyListeners();
    await FirebaseFirestore.instance.collection(email).doc(documentID).set({
      'email': email,
      'name': name,
      'home_town': homeTown,
      'contact_no': contactNo,
      'image': image,
    }).onError((error, stackTrace) {
      if (error.toString().isNotEmpty) {
        isLoading = false;
        notifyListeners();
        return UtilProvider.showScaffoldMessege(context);
      }
    }).then((value) {
      UtilProvider.showScaffoldMessegeAfterUpdate(context);
      isLoading = false;
      notifyListeners();
    });
  }

  // change image
  String imagePath = '';
  pickImage() async {
    final imageFromGallery =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (imageFromGallery == null) {
      return;
    }
    final bytes = File(imageFromGallery.path).readAsBytesSync();
    imagePath = base64Encode(bytes);
    notifyListeners();
  }
}
