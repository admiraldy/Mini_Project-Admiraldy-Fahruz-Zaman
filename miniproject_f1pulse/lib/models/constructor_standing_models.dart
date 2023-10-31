import 'package:miniproject_f1pulse/theme/team_color_theme.dart';

class ConstructorStanding {
  final int position;
  final String constructorName;
  final int points;
  final String constructorImages;
  final String colorScheme;

  ConstructorStanding(
      {required this.position,
      required this.constructorName,
      required this.points,
      required this.constructorImages,
      required this.colorScheme});

  factory ConstructorStanding.fromJson(Map<String, dynamic> json) {
    return ConstructorStanding(
      position: int.parse(json['position']),
      constructorName: json['Constructor']['name'],
      points: int.parse(json['points']),
      constructorImages:
          'assets/images/constructor/${json['Constructor']['constructorId']}.png',
      colorScheme: TeamColor.get(json['Constructor']['name']),
    );
  }
}
