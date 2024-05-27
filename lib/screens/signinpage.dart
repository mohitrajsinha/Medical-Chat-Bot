
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medbot/screens/homepage.dart';
import 'package:medbot/screens/signuppage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String? _value;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 3, 11, 57),
      body: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Sign In',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextFormFieldWidget(
              hintText: 'Email',
              keyboardType: TextInputType.emailAddress,
            ),
            const TextFormFieldWidget(
              hintText: 'Password',
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CheckBoxWidget(
                  text: 'Remember me',
                  value: 'YES',
                  groupValue: _value,
                  onChanged: (String value) {
                    setState(() {
                      _value = value;
                      color = const Color.fromARGB(255, 89, 200, 106);
                    });
                  },
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(
                      color: Color.fromARGB(255, 112, 102, 134),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const homePage()));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: const Color.fromARGB(255, 89, 200, 106),
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 2.8,
                    vertical: 18,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(color: Color.fromARGB(255, 3, 11, 57)),
                ),
              ),
            ),
            const Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Color.fromARGB(255, 112, 102, 134),
                  ),
                ),
                Text(
                  'or',
                  style: TextStyle(
                    color: Color.fromARGB(255, 112, 102, 134),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Color.fromARGB(255, 112, 102, 134),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SVGIcon('assets/icons/google_icon.svg'),
                SVGIcon('assets/icons/apple_icon.svg'),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account? ',
                  style: TextStyle(
                    color: Color.fromARGB(255, 112, 102, 134),
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SignUpPage()));
                  },
                  child: const Text(
                    'Create new',
                    style: TextStyle(
                      color: Color.fromARGB(255, 89, 200, 106),
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget SVGIcon(String imgsrc) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      hoverColor: Colors.transparent,
      onTap: () {},
      child: SvgPicture.asset(
        imgsrc,
        height: 45,
        width: 45,
      ),
    );
  }
}

class TextFormFieldWidget extends StatefulWidget {
  final String? hintText;
  final TextInputType? keyboardType;
  final bool? obscureText;
  const TextFormFieldWidget({
    super.key,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 18,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 37, 43, 57).withOpacity(0.4),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
        ),
      ),
      child: TextFormField(
        style: const TextStyle(
          fontSize: 20,
          color: Color.fromARGB(255, 112, 102, 134),
        ),
        cursorColor: const Color.fromARGB(255, 112, 102, 134),
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText!,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Color.fromARGB(255, 112, 102, 134),
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class CheckBoxWidget<T> extends StatelessWidget {
  const CheckBoxWidget({
    Key? key,
    required this.text,
    this.value,
    this.onChanged,
    this.groupValue,
  }) : super(key: key);

  final String text;
  final T? value;
  final String? groupValue;
  final ValueChanged<T>? onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged!(value as T);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(4),
            height: 12,
            width: 12,
            color: value == groupValue
                ? const Color.fromARGB(255, 89, 200, 106)
                : const Color.fromARGB(255, 112, 102, 134),
            child: Center(
              child: Container(
                height: 12,
                width: 12,
                color: value == groupValue
                    ? const Color.fromARGB(255, 89, 200, 106)
                    : const Color.fromARGB(255, 112, 102, 134),
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Color.fromARGB(255, 112, 102, 134),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
