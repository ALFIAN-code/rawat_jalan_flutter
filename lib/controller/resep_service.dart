import 'package:pocketbase/pocketbase.dart';
import 'package:rawat_jalan/model/resep_model.dart';
import 'package:rawat_jalan/pocketbase.dart';

class ResepService {
  static Future<List<Resep>> getAllResep(PocketBase client) async {
    final records = await client.collection('resep').getFullList();
    return records.map((e) => Resep.fromJson(e.data, id: e.id)).toList();
  }

  static Future<void> createResep(Map<String, dynamic> resep) async {
    try {
      await pb.collection('resep').create(body: resep);
      print('berhasil tambah data');
    } catch (e) {
      rethrow;
    }
  }

  static Future<Resep> getResep(String id) async {
    try {
      final record = await pb.collection('resep').getOne(id);
      return Resep.fromJson(record.data);
    } catch (e) {
      print('Gagal mendapatkan data dokter: $e');
      rethrow;
    }
  }

  static Future<void> updateResep(String id, Resep resep) async {
    try {
      final record =
          await pb.collection('resep').update(id, body: resep.toJson());
      print('Data dokter berhasil diperbarui: ${record.id}');
    } catch (e) {
      print('Gagal memperbarui data dokter: $e');
    }
  }

  static Future<void> deleteResep(String id) async {
    try {
      await pb.collection('resep').delete(id);
      print('Data dokter berhasil dihapus');
    } catch (e) {
      print('Gagal menghapus data dokter: $e');
    }
  }
}
