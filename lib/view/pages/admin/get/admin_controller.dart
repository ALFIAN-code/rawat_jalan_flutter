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
  var listAdmin = <Admin>[].obs;

  @override
  void onInit() {
    super.onInit();
    print('geting data .......');
    getDokterData();
    getPasienData();
    getPendaftaranData();
    getAllAdmin();
  }

  Future<void> getAdminDataById(String noTelp) async {
    var result = await AdminService.getAdmin(pb, noTelp);
    adminData.value = result;
    update();
  }

  Future<void> getAllAdmin() async {
    try {
      var result = await AdminService.getAdminList().then(
        (value) => listAdmin.value = value,
      );
      print('panjang data admin = ${listAdmin.length}');
      update();
    } catch (e) {
      print(e);
    }
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

  void deleteDokter(String idDokter) async {
    try {
      await DokterService.deleteDokter(idDokter);
      getDokterData();
      update();
    } catch (e) {
      print(e);
    }
  }

  void deletePasien(String idPasien) async {
    try {
      await PasienService.deletePasien(idPasien);
      getPasienData();
      update();
    } catch (e) {
      print(e);
    }
  }

  void deletePendaftaran(String idPendaftaran) async {
    try {
      await PendaftaranService.deletePendaftaran(idPendaftaran);
      getPendaftaranData();
      update();
    } catch (e) {
      print(e);
    }
  }

  void updateDokter(String idDokter, Dokter dokter) async {
    try {
      await DokterService.updateDokter(idDokter, dokter);
      getDokterData();
      update();
    } catch (e) {
      print(e);
    }
  }

  void updatePasien(Pasien pasien, String id) async {
    try {
      await PasienService.updatePasien(id, pasien);
      getPasienData();
      update();
    } catch (e) {
      print(e);
    }
  }

  void updatePendaftaran(Pendaftaran pendaftaran, String id) async {
    try {
      await PendaftaranService.updatePendaftaran(id, pendaftaran);
      getPendaftaranData();
      update();
    } catch (e) {
      print(e);
    }
  }

  void createDokter(Map<String, dynamic> dokterData) async {
    try {
      await DokterService.createDokter(dokterData);
      getDokterData();
      update();
    } catch (e) {
      print(e);
    }
  }

  void createPasien(Pasien pasien) async {
    try {
      await PasienService.createPasien(pasien);
      getPasienData();
      update();
    } catch (e) {
      print(e);
    }
  }

  void createPendaftaran(Pendaftaran pendaftaran) async {
    try {
      await PendaftaranService.createPendaftaran(pendaftaran);
      getPendaftaranData();
      update();
    } catch (e) {
      print(e);
    }
  }
}
