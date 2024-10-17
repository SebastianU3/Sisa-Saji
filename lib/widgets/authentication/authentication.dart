import 'package:flutter/material.dart';
import 'package:sisa_saji/widgets/authentication/sign_in.dart';
import 'package:sisa_saji/widgets/authentication/sign_up.dart';
//TODO: Support Sign in & Sign up Widget

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool _isLogin = true;

  void _onAuthStateChange(value) {
    setState(() {
      _isLogin = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = _isLogin
        ? SignIn(
            onAuthStateChange: _onAuthStateChange,
          )
        : SignUp(
            onAuthStateChange: _onAuthStateChange,
          );
    return Column(
      children: [
        Text(
          _isLogin ? 'Let\'s Eat Something' : 'Getting Started',
          style: const TextStyle().copyWith(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        activeScreen,
      ],
    );
  }
}
