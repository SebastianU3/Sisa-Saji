import 'package:flutter/material.dart';
import 'package:sisa_saji/widgets/ui/decoration_background_default.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: decorationBackgroundDefault,
        child: Center(
          child: Image.asset('assets/logo/logo.png'),
        ),
      ),
    );
  }
}
