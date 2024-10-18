import 'package:flutter/material.dart';

class FloatingActionButtonFullwidth extends StatelessWidget {
  const FloatingActionButtonFullwidth({
    super.key,
    required this.onPressed,
    required this.label,
  });
  final void Function() onPressed;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 255, 183, 77),
        ),
        child: label,
      ),
    );
  }
}
