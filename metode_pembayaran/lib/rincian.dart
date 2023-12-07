import 'package:flutter/material.dart';
import 'package:metode_pembayaran/theme.dart';

class RincianPembayaran extends StatelessWidget {
  const RincianPembayaran({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              title: Text(
                'Rincian Pembayaran',
                style: semiBold14Black,
              ),
              tilePadding: EdgeInsets.zero,
              childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
              iconColor: Colors.black,
              initiallyExpanded: true,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Metode Pembayaran',
                      style: regular12Black400,
                    ),
                    Text(
                      'Transfer Manual',
                      style: semiBold12Black600,
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Harga',
                      style: regular12Black400,
                    ),
                    Text(
                      'Rp 100.000',
                      style: semiBold12Black600,
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Admin',
                      style: regular12Black400,
                    ),
                    Text(
                      'Rp 10.000',
                      style: semiBold12Black600,
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Tagihan',
                style: semiBold14Black,
              ),
              Text(
                'Rp 90.000',
                style: bold14Green500,
              ),
            ],
          ),
          const Divider(
            thickness: 1,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/BNI.png',
                width: 66,
                height: 33,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Transfer ke Bank Nasional Indonesia',
                    style: semiBold14Black,
                  ),
                  Text(
                    'PT Bank Negara Indonesia (Persero), Tbk',
                    style: regular12Black400,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Text(
                        '5804681463432',
                        style: bold16Black,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.copy,
                          size: 15,
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
