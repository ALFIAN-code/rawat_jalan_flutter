// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rawat_jalan/model/pendaftaran_model.dart';
// import 'package:rawat_jalan/view/component/create_jadwal_form.dart';
// import 'package:rawat_jalan/view/component/edit_jadwal_form.dart';
// import 'package:rawat_jalan/view/pages/admin/get/admin_controller.dart';
// import 'package:rawat_jalan/view/style.dart';

// class KelolaJadwalPage extends StatelessWidget {
//   KelolaJadwalPage({super.key});

//   var controller = Get.find<AdminController>();

//   @override
//   Widget build(BuildContext context) {
//     var deviceHeight = MediaQuery.of(context).size.height;

//     return Column(
//       children: [
//         Container(
//           height: deviceHeight * 0.8,
//           width: double.infinity,
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(20),
//               boxShadow: [
//                 BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     spreadRadius: 1,
//                     blurRadius: 10,
//                     offset: const Offset(0, 5))
//               ]),
//           padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(right: 40),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Data Jadwal ${controller.listJadwal.first}',
//                       style: bold20,
//                     ),
//                     const SizedBox(
//                       width: 30,
//                     ),
//                     ElevatedButton(
//                         onPressed: () {
//                           // openFormDialog(context);
//                           showDialog(
//                             context: context,
//                             builder: (context) => CreateJadwalForm(),
//                           );
//                         },
//                         child: const Row(
//                           children: [
//                             Icon(Icons.add_rounded),
//                             SizedBox(
//                               width: 5,
//                             ),
//                             Text('Tambah')
//                           ],
//                         )),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Obx(() {
//                 if (controller.listJadwal.value.isNotEmpty) {
//                   return Expanded(
//                     child: ListView(
//                       children: [
//                         Expanded(
//                             child: DataTable(
//                           columns: [
//                             DataColumn(
//                                 label: Text('Ruangan',
//                                     style: bold10.copyWith(fontSize: 12))),
//                             DataColumn(
//                                 label: Text('Nama',
//                                     style: bold10.copyWith(fontSize: 12))),
//                             DataColumn(
//                                 label: Text('tanggal',
//                                     style: bold10.copyWith(fontSize: 12))),
//                             DataColumn(
//                                 label: Text('waktu mulai',
//                                     style: bold10.copyWith(fontSize: 12))),
//                             DataColumn(
//                                 label: Text('waktu selesai',
//                                     style: bold10.copyWith(fontSize: 12))),
//                             DataColumn(
//                                 label: Text('Action',
//                                     style: bold10.copyWith(fontSize: 12))),
//                           ],
//                           rows: (controller.role == 'Dokter')
//                               ? controller.listJadwal.value
//                                   .where(
//                                   (element) =>
//                                       element.idPendaftaran ==
//                                       (controller.pendaftaranData.value
//                                           .firstWhere(
//                                         (element) =>
//                                             element.dokter ==
//                                             controller
//                                                 .dokterUser.value.iDDokter,
//                                       )).id,
//                                 )
//                                   .map((jadwal) {
//                                   Pendaftaran pendaftarandata = controller
//                                       .pendaftaranData
//                                       .firstWhere((element) =>
//                                           element.id == jadwal.idPendaftaran);
//                                   return DataRow(
//                                     cells: [
//                                       DataCell(Text(controller.listRuangan
//                                           .firstWhere((element) =>
//                                               element.idRuangan ==
//                                               jadwal.idRuangan)
//                                           .namaRuangan)),
//                                       DataCell(Text(controller.pasienData
//                                           .firstWhere((element) =>
//                                               element.id ==
//                                               pendaftarandata.pasien)
//                                           .namaLengkap)),
//                                       DataCell(Text(jadwal.tanggal)),
//                                       DataCell(Text(jadwal.waktuMulai)),
//                                       DataCell(Text(jadwal.waktuSelesai)),

//                                       DataCell(Row(
//                                         children: [
//                                           ElevatedButton(
//                                               onPressed: () {
//                                                 showDialog(
//                                                   context: context,
//                                                   builder: (context) =>
//                                                       EditJadwalForm(
//                                                     id: jadwal.idJadwal!,
//                                                   ),
//                                                 );
//                                               },
//                                               child: const Icon(Icons.edit)),
//                                           const SizedBox(
//                                             width: 5,
//                                           ),
//                                           ElevatedButton(
//                                               onPressed: () {
//                                                 controller.deleteJadwal(
//                                                     jadwal.idJadwal!);
//                                               },
//                                               child: const Icon(Icons.delete))
//                                         ],
//                                       ))
//                                       // Add more cells as needed
//                                     ],
//                                   );
//                                 }).toList()
//                               : controller.listJadwal.map((jadwal) {
//                                   Pendaftaran pendaftarandata = controller
//                                       .pendaftaranData
//                                       .firstWhere((element) =>
//                                           element.id == jadwal.idPendaftaran);
//                                   return DataRow(
//                                     cells: [
//                                       DataCell(Text(controller.listRuangan
//                                           .firstWhere((element) =>
//                                               element.idRuangan ==
//                                               jadwal.idRuangan)
//                                           .namaRuangan)),
//                                       DataCell(Text(controller.pasienData
//                                           .firstWhere((element) =>
//                                               element.id ==
//                                               pendaftarandata.pasien)
//                                           .namaLengkap)),
//                                       DataCell(Text(jadwal.tanggal)),
//                                       DataCell(Text(jadwal.waktuMulai)),
//                                       DataCell(Text(jadwal.waktuSelesai)),

//                                       DataCell(Row(
//                                         children: [
//                                           ElevatedButton(
//                                               onPressed: () {
//                                                 showDialog(
//                                                   context: context,
//                                                   builder: (context) =>
//                                                       EditJadwalForm(
//                                                     id: jadwal.idJadwal!,
//                                                   ),
//                                                 );
//                                               },
//                                               child: const Icon(Icons.edit)),
//                                           const SizedBox(
//                                             width: 5,
//                                           ),
//                                           ElevatedButton(
//                                               onPressed: () {
//                                                 controller.deleteJadwal(
//                                                     jadwal.idJadwal!);
//                                               },
//                                               child: const Icon(Icons.delete))
//                                         ],
//                                       ))
//                                       // Add more cells as needed
//                                     ],
//                                   );
//                                 }).toList(),
//                         ))
//                       ],
//                     ),
//                   );
//                 } else {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//               }),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawat_jalan/view/component/create_jadwal_form.dart';
import 'package:rawat_jalan/view/component/edit_jadwal_form.dart';
import 'package:rawat_jalan/view/pages/admin/get/admin_controller.dart';
import 'package:rawat_jalan/view/style.dart';

class KelolaJadwalPage extends StatefulWidget {
  KelolaJadwalPage({super.key});

  @override
  State<KelolaJadwalPage> createState() => _KelolaJadwalPageState();
}

class _KelolaJadwalPageState extends State<KelolaJadwalPage> {
  var controller = Get.find<AdminController>();

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;

    var jadwalByDokter = controller.listJadwal.value.where(
      (element) =>
          element.idPendaftaran ==
          (controller.pendaftaranData.value.firstWhere(
            (element) => element.dokter == controller.dokterUser.value.iDDokter,
          )).id,
    );

    return Column(
      children: [
        Container(
          height: deviceHeight * 0.8,
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
                      'Data Jadwal',
                      style: bold20,
                    ),
                    ElevatedButton(
                        onPressed: () {
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
                  return Expanded(
                    child: ListView(
                      children: [
                        DataTable(
                            columns: [
                              DataColumn(
                                  label: Text('Ruangan',
                                      style: bold10.copyWith(fontSize: 12))),
                              DataColumn(
                                  label: Text('Nama',
                                      style: bold10.copyWith(fontSize: 12))),
                              DataColumn(
                                  label: Text('Tanggal',
                                      style: bold10.copyWith(fontSize: 12))),
                              DataColumn(
                                  label: Text('Waktu mulai',
                                      style: bold10.copyWith(fontSize: 12))),
                              DataColumn(
                                  label: Text('Waktu selesai',
                                      style: bold10.copyWith(fontSize: 12))),
                              DataColumn(
                                  label: Text('action',
                                      style: bold10.copyWith(fontSize: 12))),
                            ],
                            rows: (controller.role == 'Admin')
                                ? controller.listJadwal.map((jadwal) {
                                    var pendaftaran =
                                        controller.pendaftaranData.firstWhere(
                                      (element) =>
                                          jadwal.idPendaftaran == element.id,
                                    );

                                    var pasien = controller.pasienData
                                        .firstWhere((element) =>
                                            element.id == pendaftaran.pasien);

                                    var ruangan =
                                        controller.listRuangan.firstWhere(
                                      (element) =>
                                          element.idRuangan == jadwal.idRuangan,
                                    );

                                    return DataRow(cells: [
                                      DataCell(Text(ruangan.namaRuangan)),
                                      DataCell(Text(pasien.namaLengkap)),
                                      DataCell(Text(jadwal.tanggal)),
                                      DataCell(Text(jadwal.waktuMulai)),
                                      DataCell(Text(jadwal.waktuSelesai)),
                                      DataCell(Row(
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      EditJadwalForm(
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
                                                controller.deleteJadwal(
                                                    jadwal.idJadwal!);
                                              },
                                              child: const Icon(Icons.delete))
                                        ],
                                      ))
                                    ]);
                                  }).toList()
                                : jadwalByDokter.map((jadwal) {
                                    var pendaftaran =
                                        controller.pendaftaranData.firstWhere(
                                      (element) =>
                                          jadwal.idPendaftaran == element.id,
                                    );

                                    var pasien = controller.pasienData
                                        .firstWhere((element) =>
                                            element.id == pendaftaran.pasien);

                                    var ruangan =
                                        controller.listRuangan.firstWhere(
                                      (element) =>
                                          element.idRuangan == jadwal.idRuangan,
                                    );

                                    return DataRow(cells: [
                                      DataCell(Text(ruangan.namaRuangan)),
                                      DataCell(Text(pasien.namaLengkap)),
                                      DataCell(Text(jadwal.tanggal)),
                                      DataCell(Text(jadwal.waktuMulai)),
                                      DataCell(Text(jadwal.waktuSelesai)),
                                      DataCell(Row(
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      EditJadwalForm(
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
                                                controller.deleteJadwal(
                                                    jadwal.idJadwal!);
                                              },
                                              child: const Icon(Icons.delete))
                                        ],
                                      ))
                                    ]);
                                  }).toList())
                      ],
                    ),
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
