import 'package:flutter/material.dart';
import '../../../themes/app_button_style.dart';
import '../../../themes/app_text_style.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const Text(
          'Login to your account',
          style: AppTextStyle.loginText,
        ),
        const SizedBox(height: 10),
        const Text(
          'At vero eos et accusamus et iusto odio dignissimos ducimus, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo?',
          style: AppTextStyle.textStyle,
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            ElevatedButton(
              style: AppButtonStyle.elevatButton,
              onPressed: () {},
              child: const Text('Registry'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              style: AppButtonStyle.elevatButton,
              onPressed: () {},
              child: const Text('Veryfication email'),
            ),
          ],
        ),
      ],
    );
  }
}
