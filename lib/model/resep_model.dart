class Resep {
  final String? idResep;
  final String idDiagnosa;
  final String tanggalDiberikan;

  Resep({
    this.idResep,
    required this.idDiagnosa,
    required this.tanggalDiberikan,
  });

  factory Resep.fromJson(Map<String, dynamic> json, {String? id}) {
    return Resep(
      idResep: id!,
      idDiagnosa: json['diagnosa'],
      tanggalDiberikan: json['tanggal_diberikan'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resep': idResep,
      'diagnosa': idDiagnosa,
      'tanggal_diberikan': tanggalDiberikan,
    };
  }
}
