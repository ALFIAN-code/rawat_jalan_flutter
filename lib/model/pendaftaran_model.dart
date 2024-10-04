class Pendaftaran {
  int idPendaftaran;
  int idAdmin;
  int idPasien;
  int idDokter;
  DateTime tanggal;
  String keluhan;

  Pendaftaran({
    required this.idPendaftaran,
    required this.idAdmin,
    required this.idPasien,
    required this.idDokter,
    required this.tanggal,
    required this.keluhan,
  });

  factory Pendaftaran.fromJson(Map<String, dynamic> json) {
    return Pendaftaran(
      idPendaftaran: json['ID_Pendaftaran'],
      idAdmin: json['ID_admin'],
      idPasien: json['ID_Pasien'],
      idDokter: json['ID_Dokter'],
      tanggal: DateTime.parse(json['Tanggal']),
      keluhan: json['Keluhan'],
    );
  }
}