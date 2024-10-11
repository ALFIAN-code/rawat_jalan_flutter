class Dokter {
  final int idDokter;
  final String npi;
  final String namaDokter;
  final String jenisKelamin;
  final String spesialisasi;
  final String noTelp;
  final String alamat;
  final String tanggalLahir;
  final String email;
  final String statusLisensi;
  final String tanggalLisensi;
  final String namaInstitusi;
  final String password;

  Dokter({
    required this.idDokter,
    required this.npi,
    required this.namaDokter,
    required this.jenisKelamin,
    required this.spesialisasi,
    required this.noTelp,
    required this.alamat,
    required this.tanggalLahir,
    required this.email,
    required this.statusLisensi,
    required this.tanggalLisensi,
    required this.namaInstitusi,
    required this.password,
  });

  factory Dokter.fromJson(Map<String, dynamic> json) {
    return Dokter(
      idDokter: json['id_dokter'],
      npi: json['npi'],
      namaDokter: json['nama_dokter'],
      jenisKelamin: json['jenis_kelamin'],
      spesialisasi: json['spesialisasi'],
      noTelp: json['no_telp'],
      alamat: json['alamat'],
      tanggalLahir: json['tanggal_lahir'],
      email: json['email'],
      statusLisensi: json['status_lisensi'],
      tanggalLisensi: json['tanggal_lisensi'],
      namaInstitusi: json['nama_institusi'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_dokter': idDokter,
      'npi': npi,
      'nama_dokter': namaDokter,
      'jenis_kelamin': jenisKelamin,
      'spesialisasi': spesialisasi,
      'no_telp': noTelp,
      'alamat': alamat,
      'tanggal_lahir': tanggalLahir,
      'email': email,
      'status_lisensi': statusLisensi,
      'tanggal_lisensi': tanggalLisensi,
      'nama_institusi': namaInstitusi,
      'password': password,
    };
  }
}
