import 'dart:math';

import 'package:flutter/material.dart';

Color getRandomLightColor() {
  // Define a list of light colors
  final List<Color> lightColors = [
    Colors.amber[100]!,
    Colors.blue[100]!,
    Colors.green[100]!,
    Colors.pink[100]!,
    Colors.orange[100]!,
    Colors.teal[100]!,
    Colors.yellow[100]!,
    Colors.purple[100]!,
  ];

  int randomIndex = Random().nextInt(lightColors.length);

  print(randomIndex);

  // Return a random color from the list
  return lightColors[randomIndex];
}
