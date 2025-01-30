import 'package:flutter/material.dart';
import 'package:pocketplans/resources/auth_methods.dart';
import 'package:pocketplans/screens/home_screen.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/loginImage.png',
            width: 600,
          ),
          SignInButton(
            Buttons.google,
            text: "Sign In with Google",
            onPressed: () async {
              bool res = await _authMethods.signInGoogle(context);
              if (res) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()));
              }
            },
          )
        ],
      ),
    )));
  }
}
