import 'package:get/get.dart';
import 'package:rawat_jalan/model/pendaftaran_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PendaftaranController extends GetxController {
  var listPendaftaran = <Pendaftaran>[].obs;
  final SupabaseClient client = Supabase.instance.client;

  // Create Pendaftaran
  Future<void> createPendaftaran(Pendaftaran pendaftaran) async {
    final response = await client
        .from('Pendaftaran')
        .insert(pendaftaran.toJson());

    if (response.error == null) {
      fetchPendaftaran();  // Update data setelah insert
    } else {
      Get.snackbar('Error', response.error!.message);
    }
  }

  // Read Pendaftaran
  Future<void> fetchPendaftaran() async {
    final response = await client
        .from('Pendaftaran')
        .select();

    if (response.isEmpty) {
      var data = response;
      listPendaftaran.value = data.map((e) => Pendaftaran.fromJson(e)).toList();
    } else {
      Get.snackbar('Error', 'failed to fetch Pendaftaran');
    }
  }

  // Update Pendaftaran
  Future<void> updatePendaftaran(int id, Pendaftaran updatedPendaftaran) async {
    final response = await client
        .from('Pendaftaran')
        .update(updatedPendaftaran.toJson())
        .eq('ID_Pendaftaran', id);

    if (response.error == null) {
      fetchPendaftaran();  // Update data setelah update
    } else {
      Get.snackbar('Error', response.error!.message);
    }
  }

  // Delete Pendaftaran
  Future<void> deletePendaftaran(int id) async {
    final response = await client
        .from('Pendaftaran')
        .delete()
        .eq('ID_Pendaftaran', id);

    if (response.error == null) {
      fetchPendaftaran();  // Update data setelah delete
    } else {
      Get.snackbar('Error', response.error!.message);
    }
  }
}
