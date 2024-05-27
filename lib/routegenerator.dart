import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medbot/chat_screen.dart';
import 'package:medbot/screens/Login/login_screen.dart';
import 'package:medbot/screens/Profile/profilepage.dart';
import 'package:medbot/screens/Welcome/welcome_screen.dart';
import 'package:medbot/screens/homepage.dart';
import 'package:medbot/screens/settingspage.dart';
import 'package:medbot/screens/signuppage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case '/home':
        return MaterialPageRoute(
          builder: (_) =>  const homePage(),
        );
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case '/profile':
        return MaterialPageRoute(builder: (_) =>  const ProfilePage());
      // case '/editprofile':
      //   return MaterialPageRoute(builder: (_) =>  EditProfilePage());
      case '/chat':
        return MaterialPageRoute(builder: (_) => const ChatScreen());
      case '/settings':
        return MaterialPageRoute(builder: (_) => const SettingsPage());


      default:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}
class NotFoundScreen extends StatefulWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  _NotFoundScreenState createState() => _NotFoundScreenState();
}

class _NotFoundScreenState extends State<NotFoundScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SvgPicture.asset(
        'assets/icons/404.svg',
        height: 500,
        width: 500,
      )),
    );
  }
}
