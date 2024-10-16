import 'package:get/get.dart';
import 'package:rawat_jalan/controller/admin_service.dart';
import 'package:rawat_jalan/controller/diagnosa_service.dart';
import 'package:rawat_jalan/controller/dokter_service.dart';
import 'package:rawat_jalan/controller/jadwal_services.dart';
import 'package:rawat_jalan/controller/obat_service.dart';
import 'package:rawat_jalan/controller/pasien_service.dart';
import 'package:rawat_jalan/controller/pendaftaran_service.dart';
import 'package:rawat_jalan/controller/resep_service.dart';
import 'package:rawat_jalan/controller/ruangan_service.dart';
import 'package:rawat_jalan/model/admin_model.dart';
import 'package:rawat_jalan/model/diagnosa_model.dart';
import 'package:rawat_jalan/model/dokter_model.dart';
import 'package:rawat_jalan/model/jadwal_model.dart';
import 'package:rawat_jalan/model/obat_model.dart';
import 'package:rawat_jalan/model/pasien_model.dart';
import 'package:rawat_jalan/model/pendaftaran_model.dart';
import 'package:rawat_jalan/model/resep_model.dart';
import 'package:rawat_jalan/model/ruangan_model.dart';
import 'package:rawat_jalan/pocketbase.dart';

class AdminController extends GetxController {
  var adminData = Admin(idAdmin: '', nama: '', password: '', no_telp: '').obs;
  var dokterData = <Dokter>[].obs;
  var pasienData = <Pasien>[].obs;
  var pendaftaranData = <Pendaftaran>[].obs;
  var listAdmin = <Admin>[].obs;
  var listJadwal = <Jadwal>[].obs;
  var listRuangan = <Ruangan>[].obs;
  var diagnosaList = <Diagnosa>[].obs;
  var resepList = <Resep>[].obs;
  var obatList = <Obat>[].obs;

  var dokterUser = Dokter(
    npi: '',
    namaDokter: '',
    jenisKelamin: '',
    spesialisasi: '',
    alamat: '',
    tanggalLahir: '',
    email: '',
    statusLisensi: '',
    tanggalLisensi: '',
    namaInstitusi: '',
    password: '',
    noTelp: '',
  ).obs;

  var role = 'Admin';

  @override
  void onInit() {
    super.onInit();
    print('geting data .......');

    getAllRuangan();
    getResepData();
    getObatData();
    getDiagnosaData();
    getJadwalData();
    getDokterData();
    getPasienData();
    getPendaftaranData();
    getAllAdmin();
  }

  Future<void> createResep(Resep resep) async {
    try {
      await ResepService.createResep(resep.toJson());
      getResepData();
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getResepData() async {
    try {
      var result = await ResepService.getAllResep(pb);
      resepList.value = result;
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteResep(String id) async {
    try {
      await ResepService.deleteResep(id);
      getResepData();
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateResep(Resep resep, String id) async {
    try {
      await ResepService.updateResep(id, resep);
      getResepData();
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> createObat(Obat obat) async {
    try {
      await ObatService.createObat(obat.toJson());
      getResepData();
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getObatData() async {
    try {
      var result = await ObatService.getAllObat(pb);
      obatList.value = result;
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteObat(String id) async {
    try {
      await ObatService.deleteObat(id);
      getObatData();
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateObat(Obat obat, String id) async {
    try {
      await ObatService.updateObat(id, obat);
      getObatData();
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> createDiagnosa(Diagnosa diagnosa) async {
    try {
      await DiagnosaService.createDiagnosa(diagnosa.toJson());
      getDiagnosaData();
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateDiagnosa(Diagnosa diagnosa, String id) async {
    try {
      await DiagnosaService.updateDiagnosa(id, diagnosa);
      getDiagnosaData();
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteDiagnosa(String id) async {
    try {
      await DiagnosaService.deleteDiagnosa(id);
      getDiagnosaData();
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getDiagnosaData() async {
    try {
      var result = await DiagnosaService.getAllDiagnosa(pb);
      diagnosaList.value = result;
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getAllRuangan() async {
    try {
      var result = await RuanganService.getAllRuangan(pb);
      listRuangan.value = result;
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getAdminDataById(String noTelp) async {
    try {
      var result = await AdminService.getAdmin(pb, noTelp);
      adminData.value = result;
      update();
    } catch (e) {
      Get.snackbar('cannot find account',
          'check your phonenumber or password, or check your role is righ or not');
    }
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

  bool dokterAuth(String noTelp, String password) {
    if (dokterUser.value.noTelp == noTelp &&
        dokterUser.value.password == password) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> createJadwal(Jadwal jadwal) async {
    try {
      await JadwalService.createJadwal(jadwal);
      getJadwalData();
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateJadwal(Jadwal jadwal, String id) async {
    try {
      await JadwalService.updateJadwal(id, jadwal);
      getJadwalData();
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteJadwal(String id) async {
    try {
      await JadwalService.deleteJadwal(id);
      getJadwalData();
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getJadwalData() async {
    try {
      var result = await JadwalService.getAllJadwal(pb);
      listJadwal.value = result;
      update();
    } catch (e) {
      print(e);
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

  Future<void> getDokterById(String noTelp) async {
    try {
      var result = await DokterService.getDokterByNoTelp(noTelp);
      dokterUser.value = result;
      print(dokterUser.value.namaDokter);
      update();
    } catch (e) {
      print(e);
    }
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
