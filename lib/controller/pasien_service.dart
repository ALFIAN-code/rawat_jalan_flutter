import 'package:get/get.dart';
import 'package:rawat_jalan/model/pasien_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PasienController extends GetxController {
  var listPasien = <PasienModel>[].obs;

  Future<void> createPasien(PasienModel pasien) async {
    final response =
        await Supabase.instance.client.from('pasien').insert(pasien.toJson());

    if (response.error != null) {
      throw Exception('Failed to create Dokter: ${response.error!.message}');
    }
    getPasien();
  }

  Future<void> getPasien() async {
    final response = await Supabase.instance.client.from('pasien').select();

    if (response.isEmpty) {
      throw Exception('Failed to fetch Dokters ');
    } else {
      listPasien.value =
          response.map((json) => PasienModel.fromJson(json)).toList();
    }
  }

  Future<void> updatePasien(String idPasien, PasienModel pasien) async {
    final response = await Supabase.instance.client
        .from('pasien')
        .update(pasien.toJson())
        .eq('id_pasien', idPasien);

    if (response.error != null) {
      throw Exception('Failed to create Dokter: ${response.error!.message}');
    }
    getPasien();
  }

  Future<void> deletePasien(String idPasien) async {
    final response = await Supabase.instance.client
        .from('pasien')
        .delete()
        .eq('id_pasien', idPasien);
    if (response.error != null) {
      throw Exception('Failed to create Dokter: ${response.error!.message}');
    }
    getPasien();
  }
}
