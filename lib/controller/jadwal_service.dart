import 'package:get/get.dart';
import 'package:rawat_jalan/model/jadwal_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class JadwalController extends GetxController {
  final _supabase = Supabase.instance.client;
  var jadwalList = <Jadwal>[].obs;

  Future<void> getAllJadwal() async {
    final response = await _supabase.from('Jadwal').select();
    jadwalList.value = response.map((e) => Jadwal.fromJson(e)).toList();
  }

  Future<Jadwal> getJadwalById(int id) async {
    final response =
        await _supabase.from('Jadwal').select().eq('ID_Jadwal', id);
    return Jadwal.fromJson(response.single);
  }

  Future<void> createJadwal(Jadwal jadwal) async {
    final response = await _supabase.from('Jadwal').insert(jadwal.toJson());

    if (response.error != null) {
      throw Exception('Failed to create Dokter: ${response.error!.message}');
    }
    getAllJadwal();
  }

  Future<void> updateJadwal(Jadwal jadwal) async {
    final response = await _supabase
        .from('Jadwal')
        .update(jadwal.toJson())
        .eq('ID_Jadwal', jadwal.idJadwal);
    if (response.error != null) {
      throw Exception('Failed to create Dokter: ${response.error!.message}');
    }
     getAllJadwal();
  }

  Future<void> deleteJadwal(int id) async {
    final response =
        await _supabase.from('Jadwal').delete().eq('ID_Jadwal', id);
    if (response.error != null) {
      throw Exception('Failed to create Dokter: ${response.error!.message}');
    }
     getAllJadwal();
  }
}
