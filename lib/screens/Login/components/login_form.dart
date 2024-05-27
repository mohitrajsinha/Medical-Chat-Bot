import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medbot/main.dart';
import 'package:medbot/screens/Signup/components/signup_controller.dart';
import 'package:medbot/Model/user.dart' as model;
import 'package:get/get.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signUpController = Get.put(SignUpController());
    final formkey = GlobalKey<FormState>();
    return Form(
      key: formkey,
      child: Column(
        children: [
          TextFormField(
            controller: signUpController.email,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onSaved: (email) {},
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: signUpController.password,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          SizedBox(
            height: 40,
            width: 80,
            child: ElevatedButton(
              onPressed: () async {
                controller.setloginLoading(false);
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                  try {
                    final credential =
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: SignUpController.instance.email.text.trim(),
                      password: SignUpController.instance.password.text.trim(),
                    );
                    controller.setUid(credential.user!.uid);
                    fetchUserModel(credential.user!.uid);
                    controller.setloginLoading(true);
                    Navigator.pushNamed(context, '/home');
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('No user found for that email.');
                      SnackBar noUser = const SnackBar(
                        content: Text('No user found for that email.'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(noUser);
                      controller.setloginLoading(true);
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user.');
                    }
                  }
                }
              },
              child: Obx(() {
                return controller.loginLoading.value == false
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      )
                    : Text(
                        "Login".toUpperCase(),
                      );
              }),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

void fetchUserModel(String userId) async {
  try {
    DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    print(doc.data());
    // Map<dynamic, dynamic> temp = doc.data() as Map<dynamic, dynamic>;
    if (doc.exists) {
      print("${doc.data().runtimeType}");
      model.User user = model.User.fromFirestore(doc);
      // Use the fetched UserModel object as needed
      controller.setUser(user);
      controller.setUserName(user.name);
      print("user set");
      // controller.setUserEmail(userModel.email);
    } else {
      print('User document does not exist');
    }
  } catch (e) {
    print('Error fetching UserModel: $e');
  }
}
