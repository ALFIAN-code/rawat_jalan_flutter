import 'package:get/get.dart';
import 'package:rawat_jalan/controller/admin_service.dart';
import 'package:rawat_jalan/controller/dokter_service.dart';
import 'package:rawat_jalan/controller/pasien_service.dart';
import 'package:rawat_jalan/controller/pendaftaran_service.dart';
import 'package:rawat_jalan/model/admin_model.dart';
import 'package:rawat_jalan/model/dokter_model.dart';
import 'package:rawat_jalan/model/pasien_model.dart';
import 'package:rawat_jalan/model/pendaftaran_model.dart';
import 'package:rawat_jalan/pocketbase.dart';

class AdminController extends GetxController {
  var adminData = Admin(idAdmin: '', nama: '', password: '', no_telp: '').obs;
  var dokterData = <Dokter>[].obs;
  var pasienData = <Pasien>[].obs;
  var pendaftaranData = <Pendaftaran>[].obs;

  @override
  void onInit() {
    super.onInit();
    print('geting data .......');
    getDokterData();
    getPasienData();
    getPendaftaranData();
  }

  Future<void> getAdminDataById(String noTelp) async {
    var result = await AdminService.getAdmin(pb, noTelp);
    adminData.value = result;
    update();
  }

  bool adminAuth(String noTelp, String password) {
    if (adminData.value.no_telp == noTelp &&
        adminData.value.password == password) {
      return true;
    } else {
      return false;
    }
  }

  void getDokterData() async {
    try {
      await DokterService.getAllDokter(pb).then(
        (value) => dokterData.value = value,
      );
    } catch (e) {
      print(e);
    }
    update();
  }

  void getPasienData() async {
    try {
      var result =
          await PasienService.getAllPasien(); // Untuk mengambil data pasien
      pasienData.value = result;
    } catch (e) {
      print(e);
    }
    update();
  }

  void getPendaftaranData() async {
    try {
      var result = await PendaftaranService.getAllPendaftaran();
      pendaftaranData.value = result;
    } catch (e) {
      print(e);
    }
    update();
  }
}
