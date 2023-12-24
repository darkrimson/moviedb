import 'package:flutter/material.dart';
import 'components/form_widget.dart';
import 'components/header_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login to your account'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              HeaderWidget(),
              SizedBox(height: 15),
              FormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
