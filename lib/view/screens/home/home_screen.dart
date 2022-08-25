import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_on/controller/util_provider.dart';
import 'package:fire_on/controller/home_provider.dart';
import 'package:fire_on/view/screens/home/widgets/home_image.dart';
import 'package:fire_on/view/utilities/box_deco.dart';
import 'package:fire_on/view/widgets/elevated_button.dart';
import 'package:fire_on/view/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user =
        Provider.of<UtilProvider>(context, listen: false).collectionName;
    final dbObj = FirebaseFirestore.instance.collection(user);
    return Container(
      decoration: BoxDeco.containerBoxDecoration(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: StreamBuilder(
          stream: dbObj.snapshots(),
          builder: (BuildContext ctxt, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!.docs.first;
              return Consumer<HomeProvider>(
                builder: (BuildContext ctx, value, child) {
                value.changeNameControl.text = data['name'];
                value.changeHomeTownControl.text = data['home_town'];
                value.changeContactControl.text = data['contact_no'];
                return Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: ListView(
                    children: [
                      const SizedBox(height: 15),
                      const Text(
                        'Fire - On',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Schyler'),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      HomeImageWidget(imagePath: data['image']),
                      const SizedBox(height: 20),
                      TextFieldWidget(
                        hintText: '',
                        maxLen: 20,
                        control: value.changeNameControl,
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 5),
                      TextFieldWidget(
                        hintText: '',
                        maxLen: 20,
                        control: value.changeHomeTownControl,
                        icon: Icons.location_on_outlined,
                      ),
                      const SizedBox(height: 5),
                      TextFieldWidget(
                        hintText: '',
                        maxLen: 10,
                        control: value.changeContactControl,
                        icon: Icons.phone,
                      ),
                      const SizedBox(height: 20),
                      if (value.isLoading == true)
                       const Center(child:  CircularProgressIndicator()),
                      if (value.isLoading == false)
                        ElevatedButtonWidget(
                            buttonName: 'Update',
                            onTap: () {
                             value.updateUserData(
                                  email: data['email'],
                                  name: value.changeNameControl.text,
                                  homeTown: value.changeHomeTownControl.text,
                                  contactNo: value.changeContactControl.text,
                                  image: value.imagePath.isEmpty
                                      ? data['image']
                                      : value.imagePath,
                                  documentID: data.id,
                                 context: context
                                  );
                            }
                            ),
                      const SizedBox(height: 10),
                      ElevatedButtonWidget(
                          buttonName: 'LogOut',
                          isHome: true,
                          onTap: () {
                            value.logOut(context);
                          })
                    ],
                  ),
                );
              });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
