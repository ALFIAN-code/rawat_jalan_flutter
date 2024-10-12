import 'package:rawat_jalan/model/pendaftaran_model.dart';
import 'package:rawat_jalan/pocketbase.dart';

class PendaftaranService {
  static Future<void> createPendaftaran(Pendaftaran pendaftaran) async {
    try {
      final record =
          await pb.collection('pendaftaran').create(body: pendaftaran.toJson());
      print('Pendaftaran berhasil ditambahkan: ${record.id}');
    } catch (e) {
      print('Error: $e');
    }
  }

  // Ambil satu pendaftaran berdasarkan ID
  static Future<Pendaftaran?> getPendaftaranById(String id) async {
    try {
      final record = await pb.collection('pendaftaran').getOne(id);
      return Pendaftaran.fromJson(record.data, id: record.id);
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

// Ambil semua pendaftaran
  static Future<List<Pendaftaran>> getAllPendaftaran() async {
    try {
      final records = await pb.collection('pendaftaran').getFullList();
      return records
          .map((record) => Pendaftaran.fromJson(record.data, id: record.id))
          .toList();
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  static Future<void> updatePendaftaran(Pendaftaran pendaftaran) async {
    try {
      await pb
          .collection('pendaftaran')
          .update(pendaftaran.id, body: pendaftaran.toJson());
      print('Pendaftaran berhasil diupdate');
    } catch (e) {
      print('Error: $e');
    }
  }

  static Future<void> deletePendaftaran(String id) async {
    try {
      await pb.collection('pendaftaran').delete(id);
      print('Pendaftaran berhasil dihapus');
    } catch (e) {
      print('Error: $e');
    }
  }
}
