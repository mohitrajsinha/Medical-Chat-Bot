import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:medbot/controller.dart';
import 'package:medbot/firebase_options.dart';
import 'package:medbot/routegenerator.dart';
import 'package:flutter/material.dart';

Controller controller = Get.put(Controller());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // print(int.parse("3t"));
    return MaterialApp(
      title: 'AI Medical Assistant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
