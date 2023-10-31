import 'package:flutter/material.dart';
import 'package:miniproject_f1pulse/theme/textstyle_theme.dart';

class OutlineButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const OutlineButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor: Colors.transparent,
            padding: const EdgeInsets.all(16.0),
            minimumSize: const Size(300, 30),
            side: const BorderSide(color: Colors.white),
            foregroundColor: Colors.white),
        onPressed: onPressed,
        child: Text(text, style: TextAppStyle().titleStyle()));
  }
}

class FilledButtonWidget extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const FilledButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: Colors.red,
          padding: const EdgeInsets.all(16.0),
          minimumSize: const Size(300, 30),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextAppStyle().titleStyle(),
        ));
  }
}
