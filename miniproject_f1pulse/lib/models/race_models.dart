import 'package:http/http.dart' as http;
import 'dart:convert';

class Race {
  final String season;
  final String round;
  final String raceName;
  final String date;
  final String time;
  final String circuitName;
  final String locality;
  final String country;
  final String imagePath;
  final String countryImagePath;

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
  });

  factory Race.fromJson(Map<String, dynamic> json) {
    final circuit = json['Circuit'];
    final circuitImagePath =
        'assets/images/circuits/${circuit['circuitId']}.jpg';
    final countryImagePath =
        'assets/images/circuits_countries/${circuit['Location']['country']}.png';
    return Race(
      season: json['season'],
      round: json['round'],
      raceName: json['raceName'],
      date: json['date'],
      time: json['time'],
      circuitName: circuit['circuitName'],
      locality: circuit['Location']['locality'],
      country: circuit['Location']['country'],
      imagePath: circuitImagePath,
      countryImagePath: countryImagePath,
    );
  }
}

class RaceAPI {
  final endPointUrl = "https://ergast.com/api/f1/current.json";

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
}
