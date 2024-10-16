import 'package:pocketbase/pocketbase.dart';
import 'package:rawat_jalan/model/diagnosa_model.dart';
import 'package:rawat_jalan/model/dokter_model.dart';
import 'package:rawat_jalan/pocketbase.dart';

class DiagnosaService {
  static Future<List<Diagnosa>> getAllDiagnosa(PocketBase client) async {
    final records = await client.collection('diagnosa').getFullList();
    return records.map((e) => Diagnosa.fromJson(e.data, id: e.id)).toList();
  }

  static Future<void> createDiagnosa(Map<String, dynamic> dokterData) async {
    try {
      await pb.collection('diagnosa').create(body: dokterData);
      print('berhasil tambah data');
    } catch (e) {
      rethrow;
    }
  }

  static Future<Diagnosa> getDiagnosa(String dokterId) async {
    try {
      final record = await pb.collection('diagnosa').getOne(dokterId);
      return Diagnosa.fromJson(record.data);
    } catch (e) {
      print('Gagal mendapatkan data dokter: $e');
      rethrow;
    }
  }

  static Future<Diagnosa> getDiagnosaByNoTelp(String noTelp) async {
    try {
      final record =
          await pb.collection('dokter').getFirstListItem('no_telp="$noTelp"');
      return Diagnosa.fromJson(record.data, id: record.id);
    } catch (e) {
      print('Gagal mendapatkan data dokter: $e');
      rethrow;
    }
  }

  static Future<void> updateDiagnosa(String id, Diagnosa diagnosa) async {
    try {
      final record =
          await pb.collection('diagnosa').update(id, body: diagnosa.toJson());
      print('Data dokter berhasil diperbarui: ${record.id}');
    } catch (e) {
      print('Gagal memperbarui data dokter: $e');
    }
  }

  static Future<void> deleteDiagnosa(String id) async {
    try {
      await pb.collection('diagnosa').delete(id);
      print('Data dokter berhasil dihapus');
    } catch (e) {
      print('Gagal menghapus data dokter: $e');
    }
  }
}
