import 'package:pocketbase/pocketbase.dart';
import 'package:rawat_jalan/model/obat_model.dart';
import 'package:rawat_jalan/model/resep_model.dart';
import 'package:rawat_jalan/pocketbase.dart';

class ObatService {
  static Future<List<Obat>> getAllObat(PocketBase client) async {
    final records = await client.collection('obat').getFullList();
    print(records);
    return records.map((e) => Obat.fromJson(e.data, id: e.id)).toList();
  }

  static Future<void> createObat(Map<String, dynamic> resep) async {
    try {
      await pb.collection('obat').create(body: resep);
      print('berhasil tambah data');
    } catch (e) {
      rethrow;
    }
  }

  static Future<Resep> getObat(String id) async {
    try {
      final record = await pb.collection('obat').getOne(id);
      return Resep.fromJson(record.data);
    } catch (e) {
      print('Gagal mendapatkan data obat: $e');
      rethrow;
    }
  }

  static Future<void> updateObat(String id, Obat obat) async {
    try {
      final record =
          await pb.collection('obat').update(id, body: obat.toJson());
      print('Data dokter berhasil diperbarui: ${record.id}');
    } catch (e) {
      print('Gagal memperbarui data dokter: $e');
    }
  }

  static Future<void> deleteObat(String id) async {
    try {
      await pb.collection('obat').delete(id);
      print('Data dokter berhasil dihapus');
    } catch (e) {
      print('Gagal menghapus data dokter: $e');
    }
  }
}
