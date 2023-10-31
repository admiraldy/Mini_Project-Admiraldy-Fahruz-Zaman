import 'package:miniproject_f1pulse/theme/team_color_theme.dart';

class DriverStanding {
  final int position;
  final String driverName;
  final String constructorName;
  final int points;
  final String colorScheme;
  final String driverImage;

  DriverStanding({
    required this.position,
    required this.driverName,
    required this.constructorName,
    required this.points,
    required this.colorScheme,
    required this.driverImage,
  });

  factory DriverStanding.fromJson(Map<String, dynamic> json) {
    return DriverStanding(
      position: int.parse(json['position']),
      driverName:
          json['Driver']['givenName'] + ' ' + json['Driver']['familyName'],
      constructorName: json['Constructors'][0]['name'],
      points: int.parse(json['points']),
      colorScheme: TeamColor.get(json['Constructors'][0]['name']),
      driverImage: 'assets/images/drivers/${json['Driver']['driverId']}.png',
    );
  }
}
