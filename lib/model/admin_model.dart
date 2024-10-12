class Admin {
  final String idAdmin;
  final String nama;
  final String no_telp;
  final String password;

  Admin({
    required this.idAdmin,
    required this.nama,
    required this.password,
    required this.no_telp,
  });

  factory Admin.fromJson(Map<String, dynamic> json, {String? id}) {
    return Admin(
      idAdmin: id!,
      nama: json['nama'],
      password: json['password'],
      no_telp: json['no_telp']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'ID_Admin': idAdmin,
      'nama': nama,
      'password': password,
      'no_telp': no_telp
    };
  }
}
