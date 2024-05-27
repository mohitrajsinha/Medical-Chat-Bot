import 'package:get/get.dart';
class LanguageController extends GetxController {
  var language = "en".obs;

  void updateString(String newString) {
    language.value = newString;
  }
}