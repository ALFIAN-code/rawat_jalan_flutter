import 'package:get/get.dart';
import 'package:rawat_jalan/controller/admin_service.dart';
import 'package:rawat_jalan/model/admin_model.dart';
import 'package:rawat_jalan/pocketbase.dart';

class AdminController extends GetxController {
  var adminData = Admin(idAdmin: '', nama: '', password: '', no_telp: '').obs;

  void getAdminData(String noTelp) async {
    var result = await AdminService.getAdmin(pb, noTelp);
    adminData.value = result;
  }

  bool adminAuth(String noTelp, String password) {
    if (adminData.value.no_telp == noTelp &&
        adminData.value.password == password) {
      return true;
    } else {
      return false;
    }
  }
}
