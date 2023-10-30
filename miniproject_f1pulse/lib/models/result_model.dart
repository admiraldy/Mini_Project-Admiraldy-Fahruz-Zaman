import 'package:miniproject_f1pulse/theme/team_color_theme.dart';

class Result {
  final String number;
  final String position;
  final String points;
  final String driverCode;
  final String driverName;
  final String constructorName;
  final String grid;
  final String laps;
  final String status;
  final String time;
  final String colorScheme;
  final String fastestLapTime;
  final String averageSpeed;
  final String driverImage;

  Result({
    required this.number,
    required this.position,
    required this.points,
    required this.driverCode,
    required this.driverName,
    required this.constructorName,
    required this.grid,
    required this.laps,
    required this.status,
    required this.time,
    required this.colorScheme,
    required this.fastestLapTime,
    required this.averageSpeed,
    required this.driverImage,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      number: json['number'],
      position: json['positionText'],
      points: json['points'],
      driverCode: json['Driver']['code'],
      driverName:
          json['Driver']['givenName'] + ' ' + json['Driver']['familyName'],
      constructorName: json['Constructor']['name'],
      grid: json['grid'],
      laps: json['laps'],
      status: json['status'],
      time: json['Time'] != null ? json['Time']['time'] : '-',
      colorScheme: TeamColor.get(json['Constructor']['name']),
      fastestLapTime:
          json['FastestLap'] != null ? json['FastestLap']['Time']['time'] : '-',
      averageSpeed: json['FastestLap'] != null
          ? json['FastestLap']['AverageSpeed']['speed']
          : '',
      driverImage: 'assets/images/drivers/${json['Driver']['driverId']}.png',
    );
  }
}
