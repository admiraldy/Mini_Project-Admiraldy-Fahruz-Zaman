import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:miniproject_f1pulse/widgets/auth_component/button.dart';
import 'package:miniproject_f1pulse/widgets/auth_component/login_bottom_sheets.dart';
import 'package:miniproject_f1pulse/widgets/auth_component/signup_bottom_sheets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();

  void userLogIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } catch (e) {
      return errorMessage(
        'Error',
        'Please enter a valid email and password',
      );
    }
  }

  void userSignUp() async {
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        return errorMessage(
          'Error',
          'Password does not match',
        );
      }
    } catch (e) {
      return errorMessage(
        'Error',
        'Please enter a valid email and password',
      );
    }
  }

  void errorMessage(String text, String content) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(text),
            content: Text(content),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Ok'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/splashscreen.jpg',
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.black.withOpacity(0),
                  Colors.black.withOpacity(0.9),
                ])),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 50,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text('Welcome to F1 Pulse',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text('Login in or create an account here',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      )),
                  const SizedBox(
                    height: 50,
                  ),
                  FilledButtonWidget(
                    text: 'Log In',
                    onPressed: () {
                      _logIn(context);
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  OutlineButton(
                    text: 'Sign Up',
                    onPressed: () {
                      _signUp(context);
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> _signUp(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Colors.grey[300],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        context: context,
        builder: (context) {
          return SignUpBtmSheets(
            emailController: emailController,
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
            onPressed: () {
              userSignUp();
              Navigator.pop(context);
            },
            onPressedText: () {
              Navigator.pop(context);
              _logIn(context);
            },
          );
        });
  }

  Future<dynamic> _logIn(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Colors.grey[300],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        context: context,
        builder: (context) {
          return LoginBtmSheets(
            emailController: emailController,
            passwordController: passwordController,
            onPressed: () {
              userLogIn();
              Navigator.pop(context);
            },
            onPressedText: () {
              Navigator.pop(context);
              _signUp(context);
            },
          );
        });
  }
}
