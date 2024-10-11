import 'package:get/get.dart';
import 'package:rawat_jalan/model/dokter_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DokterController extends GetxController {
  var listDokter = <Dokter>[].obs;

  Future<void> createDokter(Dokter dokter) async {
    final response =
        await Supabase.instance.client.from('dokter').insert(dokter.toJson());

    if (response.error != null) {
      throw Exception('Failed to create Dokter: ${response.error!.message}');
    }
    getDokters();
  }

  Future<void> getDokters() async {
    final response = await Supabase.instance.client.from('dokter').select();

    if (response.isEmpty) {
      throw Exception('Failed to fetch Dokters ');
    } else {
      listDokter.value = response.map((json) => Dokter.fromJson(json)).toList();
    }
  }

  Future<void> updateDokter(Dokter dokter) async {
    final response = await Supabase.instance.client
        .from('dokter')
        .update(dokter.toJson())
        .eq('ID_Dokter', dokter.idDokter);

    if (response.error != null) {
      throw Exception('Failed to update Dokter: ${response.error!.message}');
    }
    getDokters();
  }

  Future<void> deleteDokter(String idDokter) async {
    final response = await Supabase.instance.client
        .from('dokter')
        .delete()
        .eq('ID_Dokter', idDokter);

    if (response.error != null) {
      throw Exception('Failed to delete Dokter: ${response.error!.message}');
    }
    getDokters();
  }
}
