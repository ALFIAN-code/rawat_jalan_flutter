import 'package:pocketbase/pocketbase.dart';
import 'package:rawat_jalan/model/dokter_model.dart';
import 'package:rawat_jalan/model/ruangan_model.dart';
import 'package:rawat_jalan/pocketbase.dart';

class RuanganService {
  static Future<List<Ruangan>> getAllRuangan(PocketBase client) async {
    final records = await client.collection('ruangan').getFullList();
    return records.map((e) => Ruangan.fromJson(e.data, id: e.id)).toList();
  }

  static Future<void> createRuangan(Map<String, dynamic> ruangan) async {
    try {
      await pb.collection('ruangan').create(body: ruangan);
      print('berhasil tambah data');
    } catch (e) {
      rethrow;
    }
  }

  static Future<Ruangan?> getRuangan(String id) async {
    try {
      final record = await pb.collection('ruangan').getOne(id);
      return Ruangan.fromJson(record.data);
    } catch (e) {
      print('Gagal mendapatkan data ruangan: $e');
      return null;
    }
  }

  static Future<void> updateRuangan(String id, Ruangan ruangan) async {
    try {
      final record =
          await pb.collection('ruangan').update(id, body: ruangan.toJson());
      print('Data ruangan berhasil diperbarui: ${record.id}');
    } catch (e) {
      print('Gagal memperbarui data dokter: $e');
    }
  }

  static Future<void> deleteRuangan(String ruangan) async {
    try {
      await pb.collection('ruangan').delete(ruangan);
      print('Data ruangan berhasil dihapus');
    } catch (e) {
      print('Gagal menghapus data ruangan: $e');
    }
  }
}
