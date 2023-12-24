// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/main/main_page.dart';

import '../../../themes/app_button_style.dart';
import '../../../themes/app_text_style.dart';
import '../../../themes/app_textfield_style.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<FormWidget> {
  final _loginTextController = TextEditingController(text: 'adam');
  final _passwordTextController = TextEditingController(text: 'adam');
  String? errorText = null;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'adam' && password == 'adam') {
      print('Connect');
      errorText = null;
      Navigator.of(context).pushReplacementNamed('/main_page');
    } else {
      print('Error');
      errorText = 'Неверный логин или пароль';
    }
    setState(() {});
  }

  void _resetPassword() {
    print('reset password');
  }

  @override
  Widget build(BuildContext context) {
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(errorText, style: AppTextStyle.errorLogin),
          const SizedBox(height: 10)
        ],
        const Text('Username', style: AppTextStyle.textStyle),
        const SizedBox(height: 5),
        TextField(
          controller: _loginTextController,
          decoration: AppTextFieldStyle.textFieldStyle,
        ),
        const SizedBox(height: 20),
        const Text('Password', style: AppTextStyle.textStyle),
        const SizedBox(height: 5),
        TextField(
          controller: _passwordTextController,
          decoration: AppTextFieldStyle.textFieldStyle,
          obscureText: true,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            ElevatedButton(
              style: AppButtonStyle.elevatButton,
              onPressed: _auth,
              child: const Text('Login'),
            ),
            const SizedBox(width: 20),
            TextButton(
              style: AppButtonStyle.textButton,
              onPressed: _resetPassword,
              child: Text('Reset Password'),
            ),
          ],
        ),
      ],
    );
  }
}
