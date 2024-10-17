import 'package:flutter/material.dart';
import 'package:sisa_saji/widgets/ui/decoration_background_default.dart';

///
/// Finished
/// Splash Screen, Screen untuk menampilkan Logo, dengan Background Default
/// Digunakan sebagai pengisi sementara selama Menunggu proses Authentication dari Supabase
/// 

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
