import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sisa_saji/screens/home.dart';
import 'package:sisa_saji/screens/splash.dart';
import 'package:sisa_saji/screens/user_authentication.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_API_URL']!,
    anonKey: dotenv.env['SUPABASE_API_KEY']!,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
          buttonTheme: ButtonThemeData().copyWith(
              colorScheme: ColorScheme.fromSeed(
                  seedColor: Color.fromARGB(255, 255, 183, 77)))),
      home: StreamBuilder(
        stream: Supabase.instance.client.auth.onAuthStateChange,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          }
          if (snapshot.hasData) {
            //TODO: Continue to home screen
          }
          //Kalau ga dapat user (Belum Login)
          return const AuthenticationScreen();
        },
      ),
    );
  }
}
