import 'package:flutter/material.dart';
import 'package:metode_pembayaran/button_component.dart';
import 'package:metode_pembayaran/payment_method.dart';
import 'package:metode_pembayaran/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ButtonComponent(
            backgroundColor: green500,
            labelStyle: medium14Primary,
            labelText: 'Pilih Metode Bayar',
            onPressed: () {
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  )),
                  context: context,
                  builder: (context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Pilih Metode Pembayaran',
                                style: medium14Black,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(Icons.close, size: 24),
                              )
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: grey50, width: 2),
                                    borderRadius: BorderRadius.circular(8)),
                                child: ListTile(
                                    onTap: () {},
                                    leading: Container(
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: grey50),
                                    ),
                                    title: Text(
                                      'Bayar di klinik',
                                      style: medium14Black,
                                    ),
                                    subtitle: Text(
                                      'Gratis biaya penanganan',
                                      style: medium12Green500,
                                    ),
                                    trailing: const Icon(
                                      Icons.radio_button_checked,
                                    )),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: grey50, width: 2),
                                    borderRadius: BorderRadius.circular(8)),
                                child: ListTile(
                                    onTap: () {},
                                    leading: Container(
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: grey50),
                                    ),
                                    title: Text(
                                      'Manual transfer',
                                      style: medium14Black,
                                    ),
                                    trailing: const Icon(
                                      Icons.radio_button_checked,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Pembayaran',
                                style: medium14Black,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Rp ',
                                    style: medium14Black,
                                  ),
                                  Text(
                                    '23.099',
                                    style: medium14Green500,
                                  ),
                                  const Icon(Icons.expand_more)
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ButtonComponent(
                                labelText: 'Bayar',
                                labelStyle: medium14Primary,
                                backgroundColor: green500,
                                onPressed: () {})),
                      ],
                    );
                  });
            }),
      ),
    );
  }
}
