import 'package:flutter/material.dart';
import 'package:sisa_saji/widgets/ui/decoration_background_default.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
//TODO: Prepare Widget Tree

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // print(Supabase.instance.client.auth.currentUser!.userMetadata);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        // currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        // onTap: _onItemTapped,
      ),
      body: Container(
        decoration: decorationBackgroundDefault,
        constraints: const BoxConstraints.expand(),
        child: Center(
          child: TextButton(
            onPressed: () async {
              await Supabase.instance.client.auth.signOut();
            },
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
