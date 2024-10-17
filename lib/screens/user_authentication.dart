import 'package:flutter/material.dart';
import 'package:sisa_saji/widgets/authentication/authentication.dart';
import 'package:sisa_saji/widgets/ui/decoration_background_default.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: decorationBackgroundDefault,
        // constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 70.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    flex: 1,
                    child: Image.asset(
                      'assets/logo/logo.png',
                      // alignment: Alignment.center,
                      height: 320,
                      width: 320,
                    ),
                  ),
                  const Flexible(
                    flex: 1,
                    child: Authentication(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
