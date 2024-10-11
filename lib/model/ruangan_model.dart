import 'package:rawat_jalan/model/poli_model.dart';

class Ruangan {
  final int idRuangan;
  final int idPoli;
  final String namaRuangan;
  final Poliklinik? poliklinik;

  Ruangan({
    required this.idRuangan,
    required this.idPoli,
    required this.namaRuangan,
    this.poliklinik,
  });

  factory Ruangan.fromJson(Map<String, dynamic> json) {
    return Ruangan(
      idRuangan: json['idRuangan'],
      idPoli: json['idPoli'],
      namaRuangan: json['namaRuangan'],
      poliklinik: json['poliklinik'] != null
          ? Poliklinik.fromJson(json['poliklinik'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idRuangan': idRuangan,
      'idPoli': idPoli,
      'namaRuangan': namaRuangan,
    };
  }
}
