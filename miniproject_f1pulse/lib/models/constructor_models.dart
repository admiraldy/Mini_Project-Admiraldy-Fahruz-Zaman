class Constructor {
  final String constructorId;
  final String name;
  final String nationality;

  Constructor({
    required this.constructorId,
    required this.name,
    required this.nationality,
  });

  factory Constructor.fromJson(Map<String, dynamic> json) {
    return Constructor(
        constructorId: json['Constructor'],
        name: json['name'],
        nationality: json['nationality']);
  }
}
