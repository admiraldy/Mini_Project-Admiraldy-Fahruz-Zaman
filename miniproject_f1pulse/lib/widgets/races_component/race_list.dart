import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:miniproject_f1pulse/theme/textstyle_theme.dart';

class RaceList extends StatelessWidget {
  final VoidCallback onTap;
  final String countryImagePath;
  final String round;
  final String raceName;
  final DateTime date;
  const RaceList({
    super.key,
    required this.onTap,
    required this.countryImagePath,
    required this.round,
    required this.raceName,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8, top: 10),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Image.asset(
                  countryImagePath,
                  height: 50,
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 50,
                  width: 1,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Round $round',
                      style: TextAppStyle().roundStyle(),
                    ),
                    Text(raceName, style: TextAppStyle().titleStyle()),
                    Text(
                      DateFormat('dd MMMM yyyy').format(date),
                      style: TextAppStyle().subtitleStyle(),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.chevron_right,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
