import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medbot/Model/user.dart' as model;
import 'package:medbot/main.dart';
import 'package:medbot/screens/Signup/components/signup_controller.dart';
import '../../../constants.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signUpController = Get.put(SignUpController());
    final formkey = GlobalKey<FormState>();
    return Form(
      key: formkey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            //name
            TextFormField(
              controller: signUpController.name,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (name) {},
              decoration: const InputDecoration(
                hintText: "Your name",
                prefixIcon: Icon(Icons.person),
              ),
            ),
            //email
            TextFormField(
              controller: signUpController.email,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              decoration: const InputDecoration(
                hintText: "Your email",
                prefixIcon: Icon(Icons.email),
              ),
            ),
            //password
            TextFormField(
              controller: signUpController.password,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            //gender
            TextFormField(
              controller: signUpController.gender,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Your gender",
                prefixIcon: Icon(Icons.man_4),
              ),
            ),
            //age
            TextFormField(
              controller: signUpController.age,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (name) {},
              decoration: const InputDecoration(
                hintText: "Your age",
                prefixIcon: Icon(Icons.pin),
              ),
            ),
            //phone
            TextFormField(
              controller: signUpController.phone,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (name) {},
              decoration: const InputDecoration(
                hintText: "Your phone number",
                prefixIcon: Icon(Icons.phone_android),
              ),
            ),
            //address
            TextFormField(
              controller: signUpController.address,
              keyboardType: TextInputType.streetAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (name) {},
              decoration: const InputDecoration(
                hintText: "Your address",
                prefixIcon: Icon(Icons.location_on),
              ),
            ),
            //height
            TextFormField(
              controller: signUpController.height,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (name) {},
              decoration: const InputDecoration(
                hintText: "Your height(cm)",
                prefixIcon: Icon(Icons.height),
              ),
            ),
            //weight
            TextFormField(
              controller: signUpController.weight,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (name) {},
              decoration: const InputDecoration(
                hintText: "Your Weight(kg)",
                prefixIcon: Icon(Icons.monitor_weight),
              ),
            ),
            //blood group
            TextFormField(
              controller: signUpController.bloodgrp,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (name) {},
              decoration: const InputDecoration(
                hintText: "Your blood group",
                prefixIcon: Icon(Icons.favorite),
              ),
            ),
            const SizedBox(height: defaultPadding / 2),
            ElevatedButton(
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                  try {
                    UserCredential credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: SignUpController.instance.email.text,
                      password: SignUpController.instance.password.text,
                    );
                    controller.setUid(credential.user!.uid);
                    CollectionReference usersRef =
                        FirebaseFirestore.instance.collection('users');
                    DocumentReference userDocRef =
                        usersRef.doc(credential.user?.uid);
                    await userDocRef.set({
                      'uid': userDocRef.id,
                      'name': SignUpController.instance.name.text,
                      'imgurl':
                          'https://media.istockphoto.com/id/1196083861/vector/simple-man-head-icon-set.jpg?s=612x612&w=0&k=20&c=a8fwdX6UKUVCOedN_p0pPszu8B4f6sjarDmUGHngvdM=',
                      'email': SignUpController.instance.email.text,
                      'gender':SignUpController.instance.gender.text,
                      'age': SignUpController.instance.age.text,
                      'phone': SignUpController.instance.phone.text,
                      'address': SignUpController.instance.address.text,
                      'height': SignUpController.instance.height.text,
                      'weight': SignUpController.instance.weight.text,
                      'bloodgrp': SignUpController.instance.bloodgrp.text,
                    });
                    controller.setUserName(SignUpController.instance.name.text);
                    controller.setUser(model.User(
                        uid: credential.user!.uid,
                        imgurl: SignUpController.instance.imgurl.text,
                        phone: SignUpController.instance.phone.text,
                        name: SignUpController.instance.name.text,
                        email: SignUpController.instance.email.text,
                        gender: SignUpController.instance.gender.text,
                        age: int.parse(SignUpController.instance.age.text),
                        address: SignUpController.instance.address.text,
                        height: int.parse(SignUpController.instance.height.text),
                        weight:
                            double.parse(SignUpController.instance.weight.text),
                        bloodgrp: SignUpController.instance.bloodgrp.text));
                    Navigator.pushNamed(context, '/home');
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      const SnackBar(
                          content: Text('The password provided is too weak.'));
                    } else if (e.code == 'email-already-in-use') {
                      const SnackBar(
                          content:
                              Text('The account already exists for that email.'));
                    }
                  } catch (e) {
                    print(e);
                  }
                }
              },
              child: Text("Sign Up".toUpperCase()),
            ),
            const SizedBox(height: defaultPadding),
          ],
        ),
      ),
    );
  }
}
