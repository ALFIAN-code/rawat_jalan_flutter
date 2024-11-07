// class DokterModelApi {
//   int? status;
//   String? message;
//   List<Payload>? payload;

//   DokterModelApi({this.status, this.message, this.payload});

//   DokterModelApi.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['payload'] != null) {
//       payload = <Payload>[];
//       json['payload'].forEach((v) {
//         payload!.add(new Payload.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = status;
//     data['message'] = message;
//     if (payload != null) {
//       data['payload'] = payload!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class DokterModelApi {
  String? iDDokter;
  String? nama;
  String? email;
  String? jenisKelamin;
  String? noHp;
  String? tanggalLahir;
  String? alamat;
  String? nPI;
  String? spesialisasi;
  String? tanggalLisensi;

  DokterModelApi(
      {this.iDDokter,
      this.nama,
      this.email,
      this.jenisKelamin,
      this.noHp,
      this.tanggalLahir,
      this.alamat,
      this.nPI,
      this.spesialisasi,
      this.tanggalLisensi});

  DokterModelApi.fromJson(Map<String, dynamic> json) {
    iDDokter = json['ID_Dokter'];
    nama = json['Nama'];
    email = json['Email'];
    jenisKelamin = json['Jenis_Kelamin'];
    noHp = json['No_Hp'];
    tanggalLahir = json['Tanggal_Lahir'];
    alamat = json['Alamat'];
    nPI = json['NPI'];
    spesialisasi = json['Spesialisasi'];
    tanggalLisensi = json['Tanggal_Lisensi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID_Dokter'] = iDDokter;
    data['Nama'] = nama;
    data['Email'] = email;
    data['Jenis_Kelamin'] = jenisKelamin;
    data['No_Hp'] = noHp;
    data['Tanggal_Lahir'] = tanggalLahir;
    data['Alamat'] = alamat;
    data['NPI'] = nPI;
    data['Spesialisasi'] = spesialisasi;
    data['Tanggal_Lisensi'] = tanggalLisensi;
    return data;
  }
}
