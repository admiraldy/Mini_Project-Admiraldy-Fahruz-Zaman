import 'package:miniproject_f1pulse/models/result_model.dart';

class Race {
  final String season;
  final String round;
  final String raceName;
  final DateTime date;
  final DateTime time;
  final String circuitName;
  final String locality;
  final String country;
  final String imagePath;
  final String countryImagePath;
  final DateTime? firstPractice;
  final DateTime? secondPractice;
  final DateTime? thirdPractice;
  final DateTime? qualifying;
  final DateTime? sprint;
  final List<Result> results;

  Race({
    required this.season,
    required this.round,
    required this.raceName,
    required this.date,
    required this.time,
    required this.circuitName,
    required this.locality,
    required this.country,
    required this.imagePath,
    required this.countryImagePath,
    this.firstPractice,
    this.secondPractice,
    this.thirdPractice,
    this.qualifying,
    this.sprint,
    required this.results,
  });

  factory Race.fromJson(Map<String, dynamic> json) {
    final circuit = json['Circuit'];
    final circuitImagePath =
        'assets/images/circuits/${circuit['circuitId']}.png';
    final countryImagePath =
        'assets/images/circuits_countries/${circuit['Location']['country']}.png';
    final time = DateTime.parse(json['date'] + ' ' + json['time']);
    final firstPractice = json['FirstPractice'] != null
        ? DateTime.parse(
            json['FirstPractice']['date'] + ' ' + json['FirstPractice']['time'])
        : null;
    final secondPractice = json['SecondPractice'] != null
        ? DateTime.parse(json['SecondPractice']['date'] +
            ' ' +
            json['SecondPractice']['time'])
        : null;
    final thirdPractice = json['ThirdPractice'] != null
        ? DateTime.parse(
            json['ThirdPractice']['date'] + ' ' + json['ThirdPractice']['time'])
        : null;
    final qualifying = json['Qualifying'] != null
        ? DateTime.parse(
            json['Qualifying']['date'] + ' ' + json['Qualifying']['time'])
        : null;
    final sprint = json['Sprint'] != null
        ? DateTime.parse(json['Sprint']['date'] + ' ' + json['Sprint']['time'])
        : null;
    return Race(
      season: json['season'],
      round: json['round'],
      raceName: json['raceName'],
      date: DateTime.parse(json['date']),
      time: time,
      circuitName: circuit['circuitName'],
      locality: circuit['Location']['locality'],
      country: circuit['Location']['country'],
      imagePath: circuitImagePath,
      countryImagePath: countryImagePath,
      firstPractice: firstPractice,
      secondPractice: secondPractice,
      thirdPractice: thirdPractice,
      qualifying: qualifying,
      sprint: sprint,
      results: [],
    );
  }
  void addResult(Map<String, dynamic> resultData) {
    final resultsList = resultData['Results'] as List;
    final resultObjects =
        resultsList.map((result) => Result.fromJson(result)).toList();
    results.addAll(resultObjects);
  }
}
