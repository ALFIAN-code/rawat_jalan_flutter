class Resep {
  final String idResep;
  final String idDiagnosa;
  final DateTime waktuDiberikan;

  Resep({
    required this.idResep,
    required this.idDiagnosa,
    required this.waktuDiberikan,
  });

  factory Resep.fromJson(Map<String, dynamic> json) {
    return Resep(
      idResep: json['idResep'],
      idDiagnosa: json['idDiagnosa'],
      waktuDiberikan: DateTime.parse(json['waktuDiberikan']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idResep': idResep,
      'idDiagnosa': idDiagnosa,
      'waktuDiberikan': waktuDiberikan.toIso8601String(),
    };
  }
}
