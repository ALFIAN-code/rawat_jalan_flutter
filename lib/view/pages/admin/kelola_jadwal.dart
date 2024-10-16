import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawat_jalan/model/pendaftaran_model.dart';
import 'package:rawat_jalan/view/component/create_jadwal_form.dart';
import 'package:rawat_jalan/view/component/edit_jadwal_form.dart';
import 'package:rawat_jalan/view/pages/admin/get/admin_controller.dart';
import 'package:rawat_jalan/view/style.dart';

class KelolaJadwalPage extends StatelessWidget {
  KelolaJadwalPage({super.key});

  var controller = Get.find<AdminController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Data Jadwal',
                      style: bold20,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // openFormDialog(context);
                          showDialog(
                            context: context,
                            builder: (context) => CreateJadwalForm(),
                          );
                        },
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
                if (controller.listJadwal.isNotEmpty) {
                  return DataTable(
                    columns: [
                      DataColumn(
                          label: Text('Ruangan',
                              style: bold10.copyWith(fontSize: 12))),
                      DataColumn(
                          label: Text('Nama',
                              style: bold10.copyWith(fontSize: 12))),
                      DataColumn(
                          label: Text('tanggal',
                              style: bold10.copyWith(fontSize: 12))),
                      DataColumn(
                          label: Text('waktu mulai',
                              style: bold10.copyWith(fontSize: 12))),
                      DataColumn(
                          label: Text('waktu selesai',
                              style: bold10.copyWith(fontSize: 12))),
                      DataColumn(
                          label: Text('Action',
                              style: bold10.copyWith(fontSize: 12))),
                    ],
                    rows: controller.listJadwal.value.map((jadwal) {
                      Pendaftaran pendaftarandata = controller.pendaftaranData
                          .firstWhere(
                              (element) => element.id == jadwal.idPendaftaran);
                      return DataRow(
                        cells: [
                          DataCell(Text(controller.listRuangan
                              .firstWhere((element) =>
                                  element.idRuangan == jadwal.idRuangan)
                              .namaRuangan)),
                          DataCell(Text(controller.pasienData
                              .firstWhere((element) =>
                                  element.id == pendaftarandata.pasien)
                              .namaLengkap)),
                          DataCell(Text(jadwal.tanggal)),
                          DataCell(Text(jadwal.waktuMulai)),
                          DataCell(Text(jadwal.waktuSelesai)),

                          DataCell(Row(
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => EditJadwalForm(
                                        id: jadwal.idJadwal!,
                                      ),
                                    );
                                  },
                                  child: const Icon(Icons.edit)),
                              const SizedBox(
                                width: 5,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    controller.deleteJadwal(jadwal.idJadwal!);
                                  },
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
