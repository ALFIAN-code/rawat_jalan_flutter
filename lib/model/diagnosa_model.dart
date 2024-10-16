class Diagnosa {
  final String? idDiagnosa;
  final String idPendaftaran;
  final String tanggal;
  final String detail;
  final String kodeDiagnosa;

  Diagnosa({
    this.idDiagnosa,
    required this.idPendaftaran,
    required this.tanggal,
    required this.detail,
    required this.kodeDiagnosa,
  });

  factory Diagnosa.fromJson(Map<String, dynamic> json, {String? id}) {
    return Diagnosa(
      idDiagnosa: id,
      idPendaftaran: json['pendaftaran'],
      tanggal: json['tanggal'],
      detail: json['detail'],
      kodeDiagnosa: json['kode_diagnosis'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pendaftaran': idPendaftaran,
      'tanggal': tanggal,
      'detail': detail,
      'kode_diagnosis': kodeDiagnosa,
    };
  }
}
