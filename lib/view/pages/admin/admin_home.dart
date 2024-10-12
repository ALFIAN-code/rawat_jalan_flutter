import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawat_jalan/view/component/navbar_item.dart';
import 'package:rawat_jalan/view/pages/admin/dashboard.dart';
import 'package:rawat_jalan/view/pages/admin/get/admin_controller.dart';
import 'package:rawat_jalan/view/pages/admin/kelola_dokter.dart';
import 'package:rawat_jalan/view/pages/admin/kelola_jadwal.dart';
import 'package:rawat_jalan/view/pages/admin/kelola_pasien.dart';
import 'package:rawat_jalan/view/style.dart';



class AdminHomePage extends StatelessWidget {
  AdminHomePage({super.key});

  var selectedPage = 0.obs;

  var controller = Get.put(AdminController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(31, 143, 232, 230),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Row(
          children: [
            Container(
              width: 250,
              margin: const EdgeInsets.only(right: 25),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 5))
                  ]),
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
              child: Obx(
                () => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('lib/view/asset/logo.png'),
                    const SizedBox(
                      height: 60,
                    ),
                    NavbarButton(
                        text: "Dashboard",
                        onTap: () {
                          selectedPage.value = 0;
                        },
                        icon: const Icon(Icons.healing),
                        selected: (selectedPage.value == 0) ? true : false),
                    NavbarButton(
                        text: "Dokter",
                        onTap: () {
                          selectedPage.value = 1;
                        },
                        icon: const Icon(Icons.healing),
                        selected: (selectedPage.value == 1) ? true : false),
                    NavbarButton(
                        text: "Pasien",
                        onTap: () {
                          selectedPage.value = 2;
                        },
                        icon: const Icon(Icons.healing),
                        selected: (selectedPage.value == 2) ? true : false),
                    NavbarButton(
                        text: "Jadwal",
                        onTap: () {
                          selectedPage.value = 3;
                        },
                        icon: const Icon(Icons.healing),
                        selected: (selectedPage.value == 3) ? true : false),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: const Offset(0, 5))
                          ],
                          color: const Color(0xffEFF3F4),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1000)),
                            child: Image.asset(
                              'lib/view/asset/admin_logo.jpg',
                              height: 100,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            controller.adminData.value.nama,
                            style: bold14,
                          )
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.logout),
                        Text(
                          'Logout',
                          style: regular14,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(child: Obx(
              () {
                if (selectedPage.value == 0) {
                  return OverviewPage();
                } else if (selectedPage.value == 1) {
                  return const KelolaDokterPage();
                } else if (selectedPage.value == 2) {
                  return const KelolaPasienPage();
                } else if (selectedPage.value == 3) {
                  return const KelolaJadwalPage();
                } else {
                  return const Center(
                    child: Text('Halaman tidak ditemukan'),
                  );
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
