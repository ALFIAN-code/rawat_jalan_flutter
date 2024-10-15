import 'package:pocketbase/pocketbase.dart';
import 'package:rawat_jalan/model/dokter_model.dart';
import 'package:rawat_jalan/pocketbase.dart';

class DokterService {
  static Future<List<Dokter>> getAllDokter(PocketBase client) async {
    final records = await client.collection('dokter').getFullList();
    return records.map((e) => Dokter.fromJson(e.data, id: e.id)).toList();
  }

  static Future<void> createDokter(Map<String, dynamic> dokterData) async {
    try {
      await pb.collection('dokter').create(body: dokterData);
      print('berhasil tambah data');
    } catch (e) {
      rethrow;
    }
  }

  static Future<Dokter?> getDokter(String dokterId) async {
    try {
      final record = await pb.collection('dokter').getOne(dokterId);
      return Dokter.fromJson(record.data);
    } catch (e) {
      print('Gagal mendapatkan data dokter: $e');
      return null;
    }
  }

  static Future<void> updateDokter(String dokterId, Dokter dokter) async {
    try {
      final record =
          await pb.collection('dokter').update(dokterId, body: dokter.toJson());
      print('Data dokter berhasil diperbarui: ${record.id}');
    } catch (e) {
      print('Gagal memperbarui data dokter: $e');
    }
  }

  static Future<void> deleteDokter(String dokterId) async {
    try {
      await pb.collection('dokter').delete(dokterId);
      print('Data dokter berhasil dihapus');
    } catch (e) {
      print('Gagal menghapus data dokter: $e');
    }
  }
}
