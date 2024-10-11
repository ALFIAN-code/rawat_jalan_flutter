class Diagnosa {
  final String idDiagnosa;
  final String idPendaftaran;
  final DateTime tanggal;
  final String detail;
  final String kodeDiagnosa;

  Diagnosa({
    required this.idDiagnosa,
    required this.idPendaftaran,
    required this.tanggal,
    required this.detail,
    required this.kodeDiagnosa,
  });

  factory Diagnosa.fromJson(Map<String, dynamic> json) {
    return Diagnosa(
      idDiagnosa: json['idDiagnosa'],
      idPendaftaran: json['idPendaftaran'],
      tanggal: DateTime.parse(json['tanggal']),
      detail: json['detail'],
      kodeDiagnosa: json['kodeDiagnosa'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idDiagnosa': idDiagnosa,
      'idPendaftaran': idPendaftaran,
      'tanggal': tanggal.toIso8601String(),
      'detail': detail,
      'kodeDiagnosa': kodeDiagnosa,
    };
  }
}
