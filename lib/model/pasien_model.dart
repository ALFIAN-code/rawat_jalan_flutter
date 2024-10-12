class Pasien {
  String id;
  String idEksternal;
  String namaLengkap;
  String namaPanggilan;
  String namaIbu;
  String jenisKelamin;
  DateTime tanggalLahir;
  String tempatLahir;
  String agama;
  String ras;
  String alamat;
  String kodeNegara;
  String noTelp;
  String bahasaUtama;
  String statusPernikahan;
  String noRekening;
  String noSim;
  String kelompokEtnis;
  String kelahiranKembar;
  String indikatorMeninggal;
  String kewarganegaraan;
  String statusMiliter;
  String? tanggalMeninggal;

  Pasien({
    required this.id,
    required this.idEksternal,
    required this.namaLengkap,
    required this.namaPanggilan,
    required this.namaIbu,
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
    this.tanggalMeninggal,
  });

  factory Pasien.fromJson(Map<String, dynamic> json, {String? id}) {
    return Pasien(
      id: id!,
      idEksternal: json['id_eksternal'],
      namaLengkap: json['nama_lengkap'],
      namaPanggilan: json['nama_panggilan'],
      namaIbu: json['nama_ibu'],
      jenisKelamin: json['jenis_kelamin'],
      tanggalLahir: DateTime.parse(json['tanggal_lahir']),
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
      tanggalMeninggal: json['tanggal_meninggal'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_eksternal': idEksternal,
      'nama_lengkap': namaLengkap,
      'nama_panggilan': namaPanggilan,
      'nama_ibu': namaIbu,
      'jenis_kelamin': jenisKelamin,
      'tanggal_lahir': tanggalLahir.toIso8601String(),
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
      'tanggal_meninggal': tanggalMeninggal,
    };
  }
}
