import 'package:flutter/material.dart';

class AppButtonStyle {
  static final elevatButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
      const Color(0xFF01B4E4),
    ),
  );
  static final textButton = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(
      const Color(0xFF01B4E4),
    ),
  );
}
