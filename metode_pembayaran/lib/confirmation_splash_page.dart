import 'package:flutter/material.dart';
import 'package:metode_pembayaran/button_component.dart';
import 'package:metode_pembayaran/theme.dart';

class ConfirmationSplashView extends StatelessWidget {
  const ConfirmationSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/confirmation.png',
              width: 319,
              height: 303,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 319,
              child: Text(
                'Pembayaranmu segera dikonfirmasi, silahkan menunggu',
                style: semiBold14Black,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ButtonComponent(
                labelText: 'Lihat rincian',
                labelStyle: semiBold12Grey10,
                backgroundColor: green500,
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
