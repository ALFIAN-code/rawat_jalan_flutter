class Obat {
  final String? idObat;
  final String idResep;
  final String namaObat;
  final String jenisObat;
  final String dosis;
  final String rutePemberian;

  Obat({
    this.idObat,
    required this.idResep,
    required this.namaObat,
    required this.jenisObat,
    required this.dosis,
    required this.rutePemberian,
  });

  factory Obat.fromJson(Map<String, dynamic> json, {String? id}) {
    return Obat(
      idObat: id,
      idResep: json['resep'],
      namaObat: json['nama_obat'],
      jenisObat: json['jenis_obat'],
      dosis: json['dosis'],
      rutePemberian: json['rute_pemberian'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resep': idResep,
      'nama_obat': namaObat,
      'jenis_obat': jenisObat,
      'dosis': dosis,
      'rute_pemberian': rutePemberian,
    };
  }
}
