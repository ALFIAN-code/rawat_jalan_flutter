import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:rawat_jalan/view/pages/admin/get/admin_controller.dart';
import 'package:rawat_jalan/view/style.dart';

class KelolaDokterPage extends StatelessWidget {
  KelolaDokterPage({super.key});

  var controller = Get.find<AdminController>();

  int calculateAge(String birthdateString) {
    DateTime birthdate = DateTime.parse(birthdateString);
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthdate.year;

    if (currentDate.month < birthdate.month ||
        (currentDate.month == birthdate.month &&
            currentDate.day < birthdate.day)) {
      age--;
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                'Kelola Dokter',
                style: bold31,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 500,
          width: double.infinity,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Data Dokter',
                      style: bold20,
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Icon(Icons.add_rounded),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Tambah')
                          ],
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                if (controller.dokterData.isNotEmpty) {
                  return DataTable(
                    columns: const [
                      DataColumn(label: Text('NPI')),
                      DataColumn(label: Text('Nama')),
                      DataColumn(label: Text('Kelamin')),
                      DataColumn(label: Text('Alamat')),
                      DataColumn(label: Text('Tgl lahir')),
                      DataColumn(label: Text('Spesialisasi')),
                      DataColumn(label: Text('Umur')),
                      DataColumn(label: Text('No telp')),
                      DataColumn(label: Text('Lisensi')),
                      DataColumn(label: Text('action'))
                      // Add more columns as needed
                    ],
                    rows: controller.dokterData.value.map((dokter) {
                      return DataRow(
                        cells: [
                          DataCell(Text(dokter.npi)),
                          DataCell(Text(dokter.namaDokter)),
                          DataCell(Text(dokter.jenisKelamin)),
                          DataCell(Text(dokter.alamat)),
                          DataCell(Text(
                              '${dokter.tanggalLahir.day}-${dokter.tanggalLahir.month}-${dokter.tanggalLahir.year}')),
                          DataCell(Text(dokter.spesialisasi)),
                          DataCell(Text(
                              '${calculateAge('${dokter.tanggalLahir}')}')),
                          DataCell(Text(dokter.noTelp)),
                          DataCell(Text(dokter.statusLisensi)),
                          DataCell(Row(
                            children: [
                              ElevatedButton(
                                  onPressed: () {},
                                  child: const Icon(Icons.edit)),
                              const SizedBox(
                                width: 5,
                              ),
                              ElevatedButton(
                                  onPressed: () {},
                                  child: const Icon(Icons.delete))
                            ],
                          ))

                          // Add more cells as needed
                        ],
                      );
                    }).toList(),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
            ],
          ),
        ),
      ],
    );
  }
}
