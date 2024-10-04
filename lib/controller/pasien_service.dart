import 'package:rawat_jalan/model/pasien_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Pasien {
  Future<void> createPasien(PasienModel pasien) async {
    final response =
        await Supabase.instance.client.from('pasien').insert(pasien.toJson());
  }

  Future<List<PasienModel>> getPasien() async {
    final response = await Supabase.instance.client.from('pasien').select();

    final data = response as List;
    return data.map((json) => PasienModel.fromJson(json)).toList();
  }

  Future<void> updatePasien(String idPasien, PasienModel pasien) async {
    final response = await Supabase.instance.client
        .from('pasien')
        .update(pasien.toJson())
        .eq('id_pasien', idPasien);
  }

  Future<void> deletePasien(String idPasien) async {
  final response = await Supabase.instance.client
      .from('pasien')
      .delete()
      .eq('id_pasien', idPasien);
}
}
