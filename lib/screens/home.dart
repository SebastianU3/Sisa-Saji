import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: Row(
        children: [
          Center(
            child: Text('Hello'),
          ),
          Center(
            child: Text('Hello'),
          ),
          Center(
            child: Text('Hello'),
          ),
        ],
      ),
      body: Center(
        child: Text('Hello'),
      ),
    );
  }
}
