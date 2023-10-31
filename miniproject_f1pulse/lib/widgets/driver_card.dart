import 'package:flutter/material.dart';

class DriverCard extends StatelessWidget {
  final String driverName;
  final String constructorName;
  final String driverImage;
  const DriverCard({
    super.key,
    required this.driverName,
    required this.constructorName,
    required this.driverImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Driver Name',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  driverName,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Constructor Name',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  constructorName,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Image.asset(driverImage, height: 100),
          ],
        ),
      ),
    );
  }
}
