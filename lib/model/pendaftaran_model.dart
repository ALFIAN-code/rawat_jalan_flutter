import 'package:rawat_jalan/model/admin_model.dart';
import 'package:rawat_jalan/model/dokter_model.dart';
import 'package:rawat_jalan/model/pasien_model.dart';

class Pendaftaran {
  int idPendaftaran;
  int idAdmin;
  int idPasien;
  int idDokter;
  String tanggal;
  String keluhan;
  String status;
  Dokter dokter;
  PasienModel? pasien;
  Admin? admin;

  Pendaftaran(
      {required this.idPendaftaran,
      required this.idAdmin,
      required this.idPasien,
      required this.idDokter,
      required this.tanggal,
      required this.keluhan,
      required this.status,
      required this.dokter,
      this.pasien,
      this.admin});

  factory Pendaftaran.fromJson(Map<String, dynamic> json) {
    return Pendaftaran(
        idPendaftaran: json['ID_Pendaftaran'],
        idAdmin: json['ID_Admin'],
        idPasien: json['ID_Pasien'],
        idDokter: json['ID_Dokter'],
        tanggal: json['Tanggal'],
        keluhan: json['Keluhan'],
        status: json['Status'],
        dokter: Dokter.fromJson(json['dokter']),
        pasien: json['pasien'] != null
            ? PasienModel.fromJson(json['pasien'])
            : null,
        admin: json['admin'] != null ? Admin.fromJson(json['admin']) : null);
  }

  Map<String, dynamic> toJson() {
    return {
      'ID_Pendaftaran': idPendaftaran,
      'ID_Admin': idAdmin,
      'ID_Pasien': idPasien,
      'ID_Dokter': idDokter,
      'Tanggal': tanggal,
      'Keluhan': keluhan,
      'Status': status,
    };
  }
}
