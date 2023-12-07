import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:metode_pembayaran/theme.dart';

class MenungguPembayaran extends StatelessWidget {
  const MenungguPembayaran({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Menunggu Pembayaran',
            style: semiBold14Black,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(children: [
            SizedBox(
              width: 179,
              child: Text(
                'Selesaikan pembayaran pada',
                style: regular12Grey400,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              alignment: Alignment.center,
              width: 23,
              height: 28,
              decoration: BoxDecoration(
                color: green500,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('20', style: regular10Green50),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              ':',
              style: GoogleFonts.poppins(fontSize: 10),
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              alignment: Alignment.center,
              width: 23,
              height: 28,
              decoration: BoxDecoration(
                color: green500,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('40', style: regular10Green50),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              ':',
              style: GoogleFonts.poppins(fontSize: 10),
            ),
            const SizedBox(
              width: 4,
            ),
            Container(
              alignment: Alignment.center,
              width: 23,
              height: 28,
              decoration: BoxDecoration(
                color: green500,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '00',
                style: regular10Green50,
              ),
            ),
          ])
        ],
      ),
    );
  }
}
