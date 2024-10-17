import 'package:flutter/material.dart';

//Default Background for Gradient 

BoxDecoration decorationBackgroundDefault = const BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Color.fromARGB(255, 178, 223, 152),
      Color.fromARGB(255, 207, 233, 192),
      Color.fromARGB(255, 255, 255, 255),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
);
