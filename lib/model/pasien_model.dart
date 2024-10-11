

class PasienModel {
  final int idPasien;
  final String namaLengkap;
  final String namaPanggilan;
  final String namaIbuPasien;
  final String jenisKelamin;
  final String tanggalLahir;
  final String tempatLahir;
  final String agama;
  final String ras;
  final String alamat;
  final String kodeNegara;
  final String noTelp;
  final String bahasaUtama;
  final String statusPernikahan;
  final String noRekening;
  final String noSim;
  final String kelompokEtnis;
  final bool kelahiranKembar;
  final bool indikatorMeninggal;
  final String kewarganegaraan;
  final String statusMiliter;
  final String tanggalPasienMeninggal;

  PasienModel({
    required this.idPasien,
    required this.namaLengkap,
    required this.namaPanggilan,
    required this.namaIbuPasien,
    required this.jenisKelamin,
    required this.tanggalLahir,
    required this.tempatLahir,
    required this.agama,
    required this.ras,
    required this.alamat,
    required this.kodeNegara,
    required this.noTelp,
    required this.bahasaUtama,
    required this.statusPernikahan,
    required this.noRekening,
    required this.noSim,
    required this.kelompokEtnis,
    required this.kelahiranKembar,
    required this.indikatorMeninggal,
    required this.kewarganegaraan,
    required this.statusMiliter,
    required this.tanggalPasienMeninggal,
  });

  factory PasienModel.fromJson(Map<String, dynamic> json) {
    return PasienModel(
      idPasien: json['id_pasien'],
      namaLengkap: json['nama_lengkap'],
      namaPanggilan: json['nama_panggilan'],
      namaIbuPasien: json['nama_ibu_pasien'],
      jenisKelamin: json['jenis_kelamin'],
      tanggalLahir: json['tanggal_lahir'],
      tempatLahir: json['tempat_lahir'],
      agama: json['agama'],
      ras: json['ras'],
      alamat: json['alamat'],
      kodeNegara: json['kode_negara'],
      noTelp: json['no_telp'],
      bahasaUtama: json['bahasa_utama'],
      statusPernikahan: json['status_pernikahan'],
      noRekening: json['no_rekening'],
      noSim: json['no_sim'],
      kelompokEtnis: json['kelompok_etnis'],
      kelahiranKembar: json['kelahiran_kembar'],
      indikatorMeninggal: json['indikator_meninggal'],
      kewarganegaraan: json['kewarganegaraan'],
      statusMiliter: json['status_militer'],
      tanggalPasienMeninggal: json['tanggal_pasien_meninggal'] ?? '-',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_pasien': idPasien,
      'nama_lengkap': namaLengkap,
      'nama_panggilan': namaPanggilan,
      'nama_ibu_pasien': namaIbuPasien,
      'jenis_kelamin': jenisKelamin,
      'tanggal_lahir': tanggalLahir,
      'tempat_lahir': tempatLahir,
      'agama': agama,
      'ras': ras,
      'alamat': alamat,
      'kode_negara': kodeNegara,
      'no_telp': noTelp,
      'bahasa_utama': bahasaUtama,
      'status_pernikahan': statusPernikahan,
      'no_rekening': noRekening,
      'no_sim': noSim,
      'kelompok_etnis': kelompokEtnis,
      'kelahiran_kembar': kelahiranKembar,
      'indikator_meninggal': indikatorMeninggal,
      'kewarganegaraan': kewarganegaraan,
      'status_militer': statusMiliter,
      'tanggal_pasien_meninggal': tanggalPasienMeninggal,
    };
  }
}
