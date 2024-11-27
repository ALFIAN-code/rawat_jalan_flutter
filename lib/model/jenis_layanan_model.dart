//to do :
// make jenis layanan model based on radiologi API

class LayananModel {
  int? idLayanan;
  String? namaLayanan;
  String? biayaLayanan;
  String? createdAt;
  String? updatedAt;

  LayananModel(
      {this.idLayanan,
      this.namaLayanan,
      this.biayaLayanan,
      this.createdAt,
      this.updatedAt});

  LayananModel.fromJson(Map<String, dynamic> json) {
    idLayanan = json['id_layanan'];
    namaLayanan = json['nama_layanan'];
    biayaLayanan = json['biaya_layanan'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_layanan'] = idLayanan;
    data['nama_layanan'] = namaLayanan;
    data['biaya_layanan'] = biayaLayanan;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
