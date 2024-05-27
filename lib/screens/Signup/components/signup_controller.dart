import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medbot/screens/Signup/components/authentication_repository.dart';

class SignUpController extends GetxController {
  static SignUpController instance = Get.find();

  final gender = TextEditingController();
  final email = TextEditingController();
  final age = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();
  final imgurl = TextEditingController();
  final height = TextEditingController();
  final bloodgrp = TextEditingController();
  final weight = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();

  void registerUser(String email, String password){
    AuthenticationRepository.instance.createUserwithEmailandPassword(email, password);
  }
}
