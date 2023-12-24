import 'package:flutter/material.dart';

abstract class AppTextFieldStyle {
  static const textFieldStyle = InputDecoration(
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF01B4E4)),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    isCollapsed: true,
  );
}
