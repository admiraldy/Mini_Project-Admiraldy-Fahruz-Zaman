import 'package:http/http.dart' as http;
import 'package:miniproject_f1pulse/models/constructor_standing_models.dart';
import 'package:miniproject_f1pulse/models/driver_standing_models.dart';
import 'dart:convert';
import 'package:miniproject_f1pulse/models/race_models.dart';

class ErgastAPI {
  final endPointUrl = "https://ergast.com/api/f1/current.json";
  final resultsEndPointUrl =
      "https://ergast.com/api/f1/current/results.json?limit=500";

  Future<List<Race>> getRaceData() async {
    final response = await http.get(Uri.parse(endPointUrl));
    final resultsResponse = await http.get(Uri.parse(resultsEndPointUrl));

    if (response.statusCode == 200 && resultsResponse.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<dynamic> races = data['MRData']['RaceTable']['Races'];

      Map<String, Map<String, dynamic>> raceResults =
          fetchRaceResults(resultsResponse);

      List<Race> raceList = races.map((race) {
        final raceModel = Race.fromJson(race);
        final resultData = raceResults[raceModel.raceName];
        if (resultData != null) {
          raceModel.addResult(resultData);
        }
        return raceModel;
      }).toList();

      return raceList;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Map<String, Map<String, dynamic>> fetchRaceResults(http.Response response) {
    Map<String, dynamic> resultsData = jsonDecode(response.body);
    List<dynamic> raceResults = resultsData['MRData']['RaceTable']['Races'];

    Map<String, Map<String, dynamic>> raceResultsMap = {};
    for (var result in raceResults) {
      final raceName = result['raceName'];
      raceResultsMap[raceName] = result;
    }

    return raceResultsMap;
  }

  Future<List<DriverStanding>> fetchDriverStandings() async {
    final response = await http.get(
        Uri.parse('http://ergast.com/api/f1/current/driverStandings.json'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final driverStandings = data['MRData']['StandingsTable']['StandingsLists']
          [0]['DriverStandings'] as List<dynamic>;
      return driverStandings
          .map((json) => DriverStanding.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to fetch driver standings');
    }
  }

  Future<List<ConstructorStanding>> fetchConstructorStandings() async {
    final response = await http.get(Uri.parse(
        'http://ergast.com/api/f1/current/constructorStandings.json'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final standings = data['MRData']['StandingsTable']['StandingsLists'][0]
          ['ConstructorStandings'] as List<dynamic>;

      return standings
          .map((standing) => ConstructorStanding.fromJson(standing))
          .toList();
    } else {
      throw Exception('Failed to load constructor standings');
    }
  }
}
