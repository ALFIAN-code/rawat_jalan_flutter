class Diagnosa {
  final String? idDiagnosa;
  // final String idPendaftaran;
  final String idJadwal;
  final String tanggal;
  final String detail;
  final String kodeDiagnosa;
  final String jenisLayanan;
  final String jenisPemeriksaan;
  final String prioritas;
  final String catatan;
  final String keluhan;

  Diagnosa(
      {this.idDiagnosa,
      // required this.idPendaftaran,
      required this.idJadwal,
      required this.keluhan,
      required this.tanggal,
      required this.detail,
      required this.kodeDiagnosa,
      required this.jenisLayanan,
      required this.jenisPemeriksaan,
      required this.catatan,
      required this.prioritas});

  factory Diagnosa.fromJson(Map<String, dynamic> json, {String? id}) {
    return Diagnosa(
        idDiagnosa: id,
        // idPendaftaran: json['pendaftaran'],
        idJadwal: json['jadwal'],
        tanggal: json['tanggal'],
        detail: json['detail'],
        kodeDiagnosa: json['kode_diagnosis'],
        jenisLayanan: json['jenis_layanan'],
        jenisPemeriksaan: json['jenis_pemeriksaan'],
        prioritas: json['prioritas'],
        catatan: json['catatan'],
        keluhan: json['keluhan']);
  }

  Map<String, dynamic> toJson() {
    return {
      // 'pendaftaran': idPendaftaran,

      'tanggal': tanggal,
      'detail': detail,
      'kode_diagnosis': kodeDiagnosa,
      'jenis_layanan': jenisLayanan,
      'jenis_pemeriksaan': jenisPemeriksaan,
      'prioritas': prioritas,
      'catatan': catatan,
      'keluhan': keluhan
    };
  }
}
