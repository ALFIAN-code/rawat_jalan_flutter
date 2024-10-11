import 'package:get/get.dart';
import 'package:rawat_jalan/controller/dokter_controller.dart';
import 'package:rawat_jalan/controller/jadwal_service.dart';
import 'package:rawat_jalan/controller/pasien_service.dart';
import 'package:rawat_jalan/controller/pendaaftaran_service.dart';

class Utils {
 static var pasienController = Get.put(PasienController());
 static var dokterController = Get.put(DokterController());
 static var pendaaftaranController = Get.put(PendaftaranController());
 static var jadwalController = Get.put(JadwalController());

  static void getAllData(){
    pasienController.getPasien();
    dokterController.getDokters();
    pendaaftaranController.fetchPendaftaran();
    jadwalController.getAllJadwal();
  }
}
