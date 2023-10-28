class Driver {
  final String driverId;
  final String permanentNumber;
  final String code;
  final String givenName;
  final String familyName;
  final DateTime dateOfBirth;
  final String nationality;

  Driver({
    required this.driverId,
    required this.permanentNumber,
    required this.code,
    required this.givenName,
    required this.familyName,
    required this.dateOfBirth,
    required this.nationality,
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
        driverId: json['driverId'],
        permanentNumber: json['permanentNumber'],
        code: json['code'],
        givenName: json['givenName'],
        familyName: json['familyName'],
        dateOfBirth: DateTime.parse(json['dateOfBirth']),
        nationality: json['nationality']);
  }
}
