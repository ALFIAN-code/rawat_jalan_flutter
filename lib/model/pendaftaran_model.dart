class Pendaftaran {
  String? id;
  String admin;
  String pasien;
  String dokter;
  String tanggal;
  String keluhan;
  String status;

  Pendaftaran({
    this.id,
    required this.admin,
    required this.pasien,
    required this.dokter,
    required this.tanggal,
    required this.keluhan,
    required this.status,
  });

  factory Pendaftaran.fromJson(Map<String, dynamic> json, {String? id}) {
    return Pendaftaran(
      id: id!,
      admin: json['admin'],
      pasien: json['pasien'],
      dokter: json['dokter'],
      tanggal: json['tanggal'],
      keluhan: json['keluhan'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'admin': admin,
      'pasien': pasien,
      'dokter': dokter,
      'tanggal': tanggal,
      'keluhan': keluhan,
      'status': status,
    };
  }
}
