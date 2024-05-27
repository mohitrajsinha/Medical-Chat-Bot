import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:medbot/screens/Welcome/welcome_screen.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository instance = Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAllNamed('/welcome');
    } else {
      Get.offAllNamed('/home');
    }
  }

  Future<void> createUserwithEmailandPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAllNamed('/home')
          : Get.to(const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error creating account", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> loginUserwithEmailandPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error creating account", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> logout() async => await _auth.signOut();
}
