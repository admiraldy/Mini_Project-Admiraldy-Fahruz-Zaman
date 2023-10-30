import 'package:flutter/material.dart';

class TextAppStyle {
  TextStyle titleStyle() {
    return const TextStyle(
      fontFamily: 'Formula1',
      fontSize: 20,
    );
  }

  TextStyle titleStyle2() {
    return const TextStyle(
      fontFamily: 'Titilium',
      fontWeight: FontWeight.bold,
      fontSize: 25,
    );
  }

  TextStyle headerStye() {
    return const TextStyle(
      fontFamily: 'Formula1',
      fontSize: 30,
    );
  }

  TextStyle roundStyle() {
    return const TextStyle(
        fontFamily: 'Formula1', fontSize: 12, color: Colors.red);
  }

  TextStyle subtitleStyle() {
    return const TextStyle(fontFamily: 'Titilium', color: Colors.grey);
  }

  TextStyle monthStyle() {
    return const TextStyle(
        fontFamily: 'Formula1', color: Colors.white, fontSize: 14);
  }
}
