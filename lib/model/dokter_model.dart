import 'package:intl/intl.dart';

class Dokter {
  String? id;
  String npi;
  String namaDokter;
  String spesialisasi;
  String jenisKelamin;
  String noTelp;
  String alamat;
  String tanggalLahir;
  String email;
  String statusLisensi;
  String tanggalLisensi;
  String namaInstitusi;
  String password;

  Dokter({
    this.id,
    required this.npi,
    required this.namaDokter,
    required this.spesialisasi,
    required this.jenisKelamin,
    required this.noTelp,
    required this.alamat,
    required this.tanggalLahir,
    required this.email,
    required this.statusLisensi,
    required this.tanggalLisensi,
    required this.namaInstitusi,
    required this.password,
  });

  factory Dokter.fromJson(Map<String, dynamic> json, {String? id}) {
    return Dokter(
      id: id!,
      npi: json['npi'],
      namaDokter: json['nama_dokter'],
      spesialisasi: json['spesialisasi'],
      jenisKelamin: json['jenis_kelamin'],
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
      'npi': npi,
      'nama_dokter': namaDokter,
      'spesialisasi': spesialisasi,
      'jenis_kelamin': jenisKelamin,
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
