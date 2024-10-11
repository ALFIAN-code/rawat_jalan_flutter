class Obat {
  final String idObat;
  final String idResep;
  final String namaObat;
  final String jenisObat;
  final String dosis;
  final String rutePemberian;

  Obat({
    required this.idObat,
    required this.idResep,
    required this.namaObat,
    required this.jenisObat,
    required this.dosis,
    required this.rutePemberian,
  });

  factory Obat.fromJson(Map<String, dynamic> json) {
    return Obat(
      idObat: json['idObat'],
      idResep: json['idResep'],
      namaObat: json['namaObat'],
      jenisObat: json['jenisObat'],
      dosis: json['dosis'],
      rutePemberian: json['rutePemberian'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idObat': idObat,
      'idResep': idResep,
      'namaObat': namaObat,
      'jenisObat': jenisObat,
      'dosis': dosis,
      'rutePemberian': rutePemberian,
    };
  }
}
