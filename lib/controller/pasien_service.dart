import 'package:rawat_jalan/model/pasien_model.dart';
import 'package:rawat_jalan/pocketbase.dart';

class PasienService {
  static Future<void> createPasien(Pasien pasien) async {
    // Ganti dengan URL PocketBase
    try {
      final record =
          await pb.collection('pasien').create(body: pasien.toJson());
      print('Pasien berhasil ditambahkan: ${record.id}');
    } catch (e) {
      print('Error: $e');
    }
  }

  static Future<Pasien?> getPasienById(String id) async {
    try {
      final record = await pb.collection('pasien').getOne(id);
      return Pasien.fromJson(record.data, id: record.id);
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  static Future<List<Pasien>> getAllPasien() async {
    try {
      final records = await pb.collection('pasien').getFullList();
      return records
          .map((record) => Pasien.fromJson(record.data, id: record.id))
          .toList();
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  static Future<void> updatePasien(Pasien pasien) async {
    try {
      await pb.collection('pasien').update(pasien.id!, body: pasien.toJson());
      print('Pasien berhasil diupdate');
    } catch (e) {
      print('Error: $e');
    }
  }

  static Future<void> deletePasien(String id) async {
    try {
      await pb.collection('pasien').delete(id);
      print('Pasien berhasil dihapus');
    } catch (e) {
      print('Error: $e');
    }
  }
}
