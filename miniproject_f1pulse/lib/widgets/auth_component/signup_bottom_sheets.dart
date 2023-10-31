import 'package:flutter/material.dart';
import 'package:miniproject_f1pulse/widgets/auth_component/button.dart';
import 'package:miniproject_f1pulse/widgets/auth_component/text_field.dart';

class SignUpBtmSheets extends StatelessWidget {
  const SignUpBtmSheets({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    this.onPressed,
    this.onPressedText,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
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
              'Sign Up',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text('Create an account here',
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
              height: 10,
            ),
            TextFieldWidget(
              controller: confirmPasswordController,
              hintText: 'Confirm Password',
              obscureText: true,
            ),
            const SizedBox(
              height: 30,
            ),
            FilledButtonWidget(
              text: 'Sign Up',
              onPressed: onPressed,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already Have an account?'),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: onPressedText,
                  child: const Text(
                    'Log In',
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
