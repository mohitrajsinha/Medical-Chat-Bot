import 'package:get/get.dart';
import 'Model/user.dart';
import 'constants.dart' as constants;

class Controller extends GetxController {
  RxString uid = constants.uid.obs;
  void setUid(String uid) => uid = uid;
  Rx<User> user = User(
          uid: "",
          name: "",
          email: "",
          gender: "",
          age: 0,
          phone: "",
          address: "",
          height: 0,
          bloodgrp: "",
          weight: 0.0,
          imgurl: "")
      .obs;
  setUser(User user) {
    this.user.value = user;
  }

  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString imgurl = ''.obs;
  RxBool loginLoading = true.obs;
  setloginLoading(bool value) {
    loginLoading.value = value;
  }

  setUserName(String name) {
    this.name.value = name;
  }

  setUserEmail(String email) {
    this.email.value = email;
  }

  setimgurl(String imgurl) {
    this.imgurl.value = imgurl;
  }
}

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  toggleTheme(value) {
    isDarkMode.value = value;
    // logic to save the theme preference to storage mechanism.
  }
}
