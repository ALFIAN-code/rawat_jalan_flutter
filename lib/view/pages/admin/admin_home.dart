import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawat_jalan/view/component/navbar_item.dart';
import 'package:rawat_jalan/view/pages/admin/dashboard.dart';
import 'package:rawat_jalan/view/pages/admin/get/admin_controller.dart';
import 'package:rawat_jalan/view/pages/admin/kelola_dokter.dart';
import 'package:rawat_jalan/view/pages/admin/kelola_jadwal.dart';
import 'package:rawat_jalan/view/pages/admin/kelola_pasien.dart';
import 'package:rawat_jalan/view/style.dart';

class AdminHomePage extends StatefulWidget {
  AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  var selectedPage = 0;

  var controller = Get.put(AdminController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(31, 143, 232, 230),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Menyesuaikan padding berdasarkan lebar layar
          double sidePadding = constraints.maxWidth > 1200 ? 30 : 10;
          double containerWidth = constraints.maxWidth > 1200 ? 250 : 200;

          return Padding(
            padding:
                EdgeInsets.symmetric(vertical: 30, horizontal: sidePadding),
            child: Row(
              children: [
                Container(
                  width: containerWidth,
                  margin: const EdgeInsets.only(right: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
                  child: Obx(
                    () => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('lib/view/asset/logo.png'),
                        const SizedBox(height: 60),
                        NavbarButton(
                          text: "Dashboard",
                          onTap: () {
                            setState(() {
                              selectedPage = 0;
                            });
                          },
                          icon: const Icon(Icons.healing),
                          selected: (selectedPage == 0) ? true : false,
                        ),
                        NavbarButton(
                          text: "Dokter",
                          onTap: () {
                            setState(() {
                              selectedPage = 1;
                            });
                          },
                          icon: const Icon(Icons.healing),
                          selected: (selectedPage == 1) ? true : false,
                        ),
                        NavbarButton(
                          text: "Pasien",
                          onTap: () {
                            setState(() {
                              selectedPage = 2;
                            });
                          },
                          icon: const Icon(Icons.healing),
                          selected: (selectedPage == 2) ? true : false,
                        ),
                        NavbarButton(
                          text: "Jadwal",
                          onTap: () {
                            setState(() {
                              selectedPage = 3;
                            });
                          },
                          icon: const Icon(Icons.healing),
                          selected: (selectedPage == 3) ? true : false,
                        ),
                        const SizedBox(height: 50),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                spreadRadius: 1,
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                            color: const Color(0xffEFF3F4),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1000),
                                ),
                                child: Image.asset(
                                  'lib/view/asset/admin_logo.jpg',
                                  height: 100,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                controller.adminData.value.nama,
                                style: bold14,
                              ),
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: (selectedPage == 0)
                      ? OverviewPage()
                      : (selectedPage == 1)
                          ? KelolaDokterPage()
                          : (selectedPage == 2)
                              ? KelolaPasienPage()
                              : KelolaJadwalPage(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
