import 'package:rawat_jalan/model/dokter_model_api.dart';

class Jadwal {
  final String? idJadwal;
  final String idRuangan;
  final String idPendaftaran;
  // final String idDokter;
  final String tanggal;
  final String waktuMulai;
  final String waktuSelesai;

  Jadwal({
    this.idJadwal,
    required this.idRuangan,
    required this.idPendaftaran,
    // required this.idDokter,
    required this.tanggal,
    required this.waktuMulai,
    required this.waktuSelesai,
  });

  factory Jadwal.fromJson(Map<String, dynamic> json, {String? id}) {
    return Jadwal(
      idJadwal: id!,
      idRuangan: json['ruangan'],
      idPendaftaran: json['pendaftaran'],
      // idDokter: json['dokter'],
      tanggal: json['tanggal'],
      waktuMulai: json['waktu_mulai'],
      waktuSelesai: json['waktu_selesai'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id_jadwal': idJadwal,
      'ruangan': idRuangan,
      'pendaftaran': idPendaftaran,
      // 'dokter': idDokter,
      'tanggal': tanggal,
      'waktu_mulai': waktuMulai,
      'waktu_selesai': waktuSelesai,
    };
  }
}
