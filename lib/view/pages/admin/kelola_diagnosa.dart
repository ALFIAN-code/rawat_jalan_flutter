import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawat_jalan/model/obat_model.dart';
import 'package:rawat_jalan/model/pasien_model.dart';
import 'package:rawat_jalan/model/pendaftaran_model.dart';
import 'package:rawat_jalan/model/resep_model.dart';
import 'package:rawat_jalan/view/component/create_diagnosa_form.dart';
import 'package:rawat_jalan/view/component/create_obat_form.dart';
import 'package:rawat_jalan/view/component/create_resep_form.dart';
import 'package:rawat_jalan/view/component/edit_diagnosa_form.dart';
import 'package:rawat_jalan/view/pages/admin/get/admin_controller.dart';
import 'package:rawat_jalan/view/style.dart';

class KelolaDiagnosa extends StatelessWidget {
  KelolaDiagnosa({super.key});

  var controller = Get.find<AdminController>();

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Container(
          height: deviceHeight * 0.7,
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
                      'Data Diagnosa',
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
                            builder: (context) => const CreateDiagnosaForm(),
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
                if (controller.diagnosaList.isNotEmpty) {
                  return DataTable(
                    columns: [
                      DataColumn(
                          label: Text('Pasien',
                              style: bold10.copyWith(fontSize: 12))),
                      DataColumn(
                          label: Text('Tanggal',
                              style: bold10.copyWith(fontSize: 12))),
                      DataColumn(
                          label: Text('Kode diagnosa',
                              style: bold10.copyWith(fontSize: 12))),
                      DataColumn(
                          label: Text('Diagnosa',
                              style: bold10.copyWith(fontSize: 12))),
                      DataColumn(
                          label: Text('Resep',
                              style: bold10.copyWith(fontSize: 12))),
                      DataColumn(
                          label: Text('action',
                              style: bold10.copyWith(fontSize: 12))),
                    ],
                    rows: controller.diagnosaList.value.where(
                      (diagnosa) {
                        var jadwal = controller.listJadwal.value.firstWhere(
                          (jadwal) => jadwal.idJadwal == diagnosa.idJadwal,
                        );
                        if (jadwal == null) return false;
                        var pendaftaran =
                            controller.pendaftaranData.value.firstWhere(
                          (pendaftaran) =>
                              pendaftaran.id == jadwal.idPendaftaran,
                        );
                        if (pendaftaran == null) return false;
                        return pendaftaran.dokter ==
                            controller.dokterUser.value.iDDokter;
                      },
                    ).map((diagnosa) {
                      var jadwal = controller.listJadwal.value.firstWhere(
                        (jadwal) => jadwal.idJadwal == diagnosa.idJadwal,
                      );
                      var pendaftaran =
                          controller.pendaftaranData.value.firstWhere(
                        (pendaftaran) => pendaftaran.id == jadwal.idPendaftaran,
                      );
                      var pasien = controller.pasienData.value.firstWhere(
                          (pasien) => pasien.id == pendaftaran.pasien);
                      Resep resep = controller.resepList.value.firstWhere(
                          (element) =>
                              element.idDiagnosa == diagnosa.idDiagnosa,
                          orElse: () => Resep(
                                idResep: '',
                                idDiagnosa: '',
                                tanggalDiberikan: '',
                              ));
                      print('tanggal resep = ${resep.idResep}');
                      var obat = controller.obatList.value
                          .where(
                            (element) {
                              return element.idResep == resep.idResep;
                            },
                          )
                          .toList()
                          .obs;
                      print(controller.obatList.value.length);
                      print('obat = ${obat.length}');
                      return DataRow(
                        cells: [
                          DataCell(Text(pasien.namaPanggilan)),
                          DataCell(Text(diagnosa.tanggal)),
                          DataCell(Text(diagnosa.kodeDiagnosa)),
                          DataCell(Text(diagnosa.detail)),

                          DataCell((resep.idResep!.isEmpty)
                              ? ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateProperty.all<Color>(
                                            Colors.lightGreen[200]!),
                                  ),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => CreateResepForm(
                                          idDiagnosa: diagnosa.idDiagnosa!),
                                    );
                                  },
                                  child: const Text('Tambah Resep'),
                                )
                              : Row(children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            WidgetStateProperty.all<Color>(
                                                Colors.lightBlue[200]!),
                                      ),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => CreateObatForm(
                                            resepId: resep.idResep!,
                                          ),
                                        );
                                      },
                                      child: const Text('tambah obat'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 300,
                                    child: Wrap(
                                      spacing: 10.0,
                                      children: obat.map((o) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(o.namaObat),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(o.dosis),
                                          ],
                                        );
                                      }).toList(),
                                    ),
                                  )
                                ])),

                          DataCell(Row(
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => EditDiagnosaForm(
                                        id: diagnosa.idDiagnosa!,
                                      ),
                                    );
                                  },
                                  child: const Icon(Icons.edit)),
                              const SizedBox(
                                width: 5,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    controller
                                        .deleteDiagnosa(diagnosa.idDiagnosa!);
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
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
