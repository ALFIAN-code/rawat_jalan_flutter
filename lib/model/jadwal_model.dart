import 'package:rawat_jalan/model/pendaftaran_model.dart';
import 'package:rawat_jalan/model/ruangan_model.dart';

class Jadwal {
  final int idJadwal;
  final int idRuangan;
  final int idPendaftaran;
  final String tanggal;
  final String waktuMulai;
  final String waktuSelesai;
  Pendaftaran? pendaftaran;
  Ruangan? ruangan;

  Jadwal({
    required this.idJadwal,
    required this.idRuangan,
    required this.idPendaftaran,
    required this.tanggal,
    required this.waktuMulai,
    required this.waktuSelesai,
    this.pendaftaran,
    this.ruangan
  });

  factory Jadwal.fromJson(Map<String, dynamic> json) {
    return Jadwal(
      idJadwal: json['id_jadwal'],
      idRuangan: json['id_ruangan'],
      idPendaftaran: json['id_pendaftaran'],
      tanggal: json['tanggal'],
      waktuMulai: json['waktu_mulai'],
      waktuSelesai: json['waktu_selesai'],
      pendaftaran: json['pendaftaran'] != null
          ? Pendaftaran.fromJson(json['pendaftaran'])
          : null,
      ruangan: json['ruangan'] != null
          ? Ruangan.fromJson(json['ruangan'])
          : null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_jadwal': idJadwal,
      'id_ruangan': idRuangan,
      'id_pendaftaran': idPendaftaran,
      'tanggal': tanggal,
      'waktu_mulai': waktuMulai,
      'waktu_selesai': waktuSelesai,
    };
  }
}
