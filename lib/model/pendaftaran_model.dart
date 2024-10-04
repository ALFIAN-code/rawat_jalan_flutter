class Pendaftaran {
  final int idPendaftaran;
  final int idAdmin;
  final int idPasien;
  final int idDokter;
  final String tanggal;
  final String keluhan;

  Pendaftaran({
    required this.idPendaftaran,
    required this.idAdmin,
    required this.idPasien,
    required this.idDokter,
    required this.tanggal,
    required this.keluhan,
  });

  factory Pendaftaran.fromMap(Map<String, dynamic> map) {
    return Pendaftaran(
      idPendaftaran: map['id_pendaftaran'],
      idAdmin: map['id_admin'],
      idPasien: map['id_pasien'],
      idDokter: map['id_dokter'],
      tanggal: map['tanggal'],
      keluhan: map['keluhan'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_pendaftaran': idPendaftaran,
      'id_admin': idAdmin,
      'id_pasien': idPasien,
      'id_dokter': idDokter,
      'tanggal': tanggal,
      'keluhan': keluhan,
    };
  }
}
