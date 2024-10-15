import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:rawat_jalan/model/admin_model.dart';
import 'package:rawat_jalan/pocketbase.dart';

class AdminService {
  static Future<Admin> getAdmin(PocketBase client, String noTelp) async {
    RecordModel record;
    try {
      record = await client
          .collection('admin')
          .getFirstListItem('no_telp="$noTelp"');

      print(record.data);
      return Admin.fromJson(record.data, id: record.id);
    } catch (e) {
      Get.snackbar('Login Invalid', 'we cannot find your account');
      rethrow;
    }
  }

  static Future<List<Admin>> getAdminList() async {
    try {
      final records = await pb.collection('admin').getFullList();
      return records
          .map((record) => Admin.fromJson(record.data, id: record.id))
          .toList();
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}
