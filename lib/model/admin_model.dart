class Admin {
  final int idAdmin;
  final String nama;
  final String password;

  Admin({
    required this.idAdmin,
    required this.nama,
    required this.password,
  });

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      idAdmin: json['ID_Admin'],
      nama: json['Nama'],
      password: json['Password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ID_Admin': idAdmin,
      'Nama': nama,
      'Password': password,
    };
  }
}
