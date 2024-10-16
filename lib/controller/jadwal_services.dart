import 'package:pocketbase/pocketbase.dart';
import 'package:rawat_jalan/model/dokter_model.dart';
import 'package:rawat_jalan/model/jadwal_model.dart';
import 'package:rawat_jalan/pocketbase.dart';

class JadwalService {
  static Future<List<Jadwal>> getAllJadwal(PocketBase client) async {
    final records = await client.collection('jadwal').getFullList();
    return records.map((e) => Jadwal.fromJson(e.data, id: e.id)).toList();
  }

  static Future<void> createJadwal(Jadwal jadwal) async {
    try {
      await pb.collection('jadwal').create(body: jadwal.toJson());
      print('berhasil tambah data');
    } catch (e) {
      rethrow;
    }
  }

  static Future<Jadwal?> getJadwal(String id) async {
    try {
      final record = await pb.collection('jadwal').getOne(id);
      return Jadwal.fromJson(record.data);
    } catch (e) {
      print('Gagal mendapatkan data dokter: $e');
      return null;
    }
  }

  static Future<void> updateJadwal(String id, Jadwal jadwal) async {
    try {
      final record =
          await pb.collection('jadwal').update(id, body: jadwal.toJson());
      print('Data jadwal berhasil diperbarui: ${record.id}');
    } catch (e) {
      print('Gagal memperbarui data dokter: $e');
    }
  }

  static Future<void> deleteJadwal(String id) async {
    try {
      await pb.collection('jadwal').delete(id);
      print('Data dokter berhasil dihapus');
    } catch (e) {
      print('Gagal menghapus data dokter: $e');
    }
  }
}
