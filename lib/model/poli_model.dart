class Poliklinik {
  final int idPoli;
  final String namaPoli;

  Poliklinik({
    required this.idPoli,
    required this.namaPoli,
  });

  factory Poliklinik.fromJson(Map<String, dynamic> json) {
    return Poliklinik(
      idPoli: json['idPoli'],
      namaPoli: json['namaPoli'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idPoli': idPoli,
      'namaPoli': namaPoli,
    };
  }
}
