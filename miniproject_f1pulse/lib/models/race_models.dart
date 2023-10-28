import 'package:http/http.dart' as http;
import 'dart:convert';

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
  final List<Result>? results;

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
    this.results,
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
    final resultsJson = json['Results'] as List<dynamic>?;
    final results =
        resultsJson?.map((result) => Result.fromJson(result)).toList();
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
      results: results,
    );
  }
}

class Result {
  final String number;
  final String position;
  final String positionText;
  final String points;
  final String driverCode;
  final String driverName;
  final String constructorName;
  final String grid;
  final String laps;
  final String status;

  Result({
    required this.number,
    required this.position,
    required this.positionText,
    required this.points,
    required this.driverCode,
    required this.driverName,
    required this.constructorName,
    required this.grid,
    required this.laps,
    required this.status,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      number: json['number'],
      position: json['position'],
      positionText: json['positionText'],
      points: json['points'],
      driverCode: json['Driver']['code'],
      driverName:
          json['Driver']['givenName'] + ' ' + json['Driver']['familyName'],
      constructorName: json['Constructor']['name'],
      grid: json['grid'],
      laps: json['laps'],
      status: json['status'],
    );
  }
}

class RaceAPI {
  final endPointUrl = "https://ergast.com/api/f1/current.json";
  final resultsEndPointUrl = "https://ergast.com/api/f1/current/results.json";

  Future<List<Race>> getRace() async {
    final response = await http.get(Uri.parse(endPointUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> races = data['MRData']['RaceTable']['Races'];

      return races.map((race) => Race.fromJson(race)).toList();
    } else {
      throw Exception('Failed to fetch races');
    }
  }

  Future<List<Result>> getResults() async {
    final response = await http.get(Uri.parse(resultsEndPointUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> results = data['MRData']['RaceTable']['Races']['Results'];

      return results.map((result) => Result.fromJson(result)).toList();
    } else {
      throw Exception('Failed to fetch results');
    }
  }
}
