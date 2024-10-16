import 'package:rawat_jalan/model/poli_model.dart';

class Ruangan {
  final String idRuangan;
  final String poli;
  final String namaRuangan;

  Ruangan({
    required this.idRuangan,
    required this.poli,
    required this.namaRuangan,
  });

  factory Ruangan.fromJson(Map<String, dynamic> json, {String? id}) {
    return Ruangan(
      idRuangan: id!,
      poli: json['poli'],
      namaRuangan: json['nama_ruangan'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idPoli': poli,
      'nama_ruangan': namaRuangan,
    };
  }
}
