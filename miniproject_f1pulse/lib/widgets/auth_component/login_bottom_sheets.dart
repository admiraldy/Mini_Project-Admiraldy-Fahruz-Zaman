import 'package:flutter/material.dart';
import 'package:miniproject_f1pulse/widgets/auth_component/button.dart';
import 'package:miniproject_f1pulse/widgets/auth_component/text_field.dart';

class LoginBtmSheets extends StatelessWidget {
  const LoginBtmSheets({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onPressed,
    this.onPressedText,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function()? onPressed;
  final Function()? onPressedText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        child: Column(
          children: [
            const Text(
              'Welcome,',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text('Glad to see you again',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                )),
            const SizedBox(
              height: 25,
            ),
            TextFieldWidget(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFieldWidget(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            const SizedBox(
              height: 30,
            ),
            FilledButtonWidget(
              text: 'Log In',
              onPressed: onPressed,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Not a member?'),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: onPressedText,
                  child: const Text(
                    'Register now',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
