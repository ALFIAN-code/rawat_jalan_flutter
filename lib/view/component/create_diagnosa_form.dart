import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawat_jalan/model/diagnosa_model.dart';
import 'package:rawat_jalan/model/jadwal_model.dart';
import 'package:rawat_jalan/model/jenis_layanan_model.dart';
import 'package:rawat_jalan/model/pendaftaran_model.dart';
import 'package:rawat_jalan/view/component/custom_button.dart';
import 'package:rawat_jalan/view/component/custom_textfield.dart';
import 'package:rawat_jalan/view/pages/admin/get/admin_controller.dart';
import 'package:rawat_jalan/view/style.dart';

class CreateDiagnosaForm extends StatefulWidget {
  const CreateDiagnosaForm({
    super.key,
  });

  @override
  State<CreateDiagnosaForm> createState() => _CreateDiagnosaFormState();
}

AdminController controller = Get.find<AdminController>();

class _CreateDiagnosaFormState extends State<CreateDiagnosaForm> {
  Future<String> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1800),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      return "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
    } else {
      return controller.text;
    }
  }

  Future<String> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      return '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
    } else {
      return '00:00';
    }
  }

  TextEditingController tanggalController = TextEditingController();
  TextEditingController kodeDiagnosaController = TextEditingController();
  TextEditingController detailController = TextEditingController();

  // TextEditingController jenisLayanan = TextEditingController();
  TextEditingController jenisPemeriksaan = TextEditingController();
  TextEditingController prioritas = TextEditingController();
  TextEditingController catatan = TextEditingController();
  TextEditingController keluhanController = TextEditingController();

  bool selectedPilihan = false;

  var jadwalList = controller.listJadwal.where(
    (jadwal) => controller.pendaftaranData
        .where(
          (pendaftaran) =>
              pendaftaran.dokter == controller.dokterUser.value.iDDokter &&
              pendaftaran.id == jadwal.idPendaftaran,
        )
        .isNotEmpty,
  );

  var selectedJadwal = controller.listJadwal
      .where((jadwal) => controller.pendaftaranData
          .where(
            (pendaftaran) =>
                pendaftaran.dokter == controller.dokterUser.value.iDDokter &&
                pendaftaran.id == jadwal.idPendaftaran,
          )
          .isNotEmpty)
      .first;

  var selectedLayanan = controller.layananList.first;

  @override
  void dispose() {
    super.dispose();
    tanggalController.dispose();
    kodeDiagnosaController.dispose();
    detailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var pasienList = controller

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(40, 30, 40, 10),
        width: 800, // Tentukan ukuran sesuai kebutuhan
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Membatasi ukuran column
          children: [
            Text("Tambah Diagnosa", style: bold24),
            const SizedBox(height: 30),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    "Tanggal",
                    style: regular14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      hint: '2024-11-9',
                      controller: tanggalController,
                      readOnly: true,
                      onTap: () async {
                        String date =
                            await _selectDate(context, tanggalController);
                        setState(() {
                          tanggalController.text = date;
                        });
                      }),
                  const SizedBox(
                    height: 20,
                  ),

                  Text(
                    "Pilih Pasien",
                    style: regular14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButton2(
                    buttonStyleData: ButtonStyleData(
                        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 2,
                          color: const Color(0xffC9C9C9).withOpacity(0.7)),
                    )),
                    isExpanded: true,
                    value: selectedJadwal,
                    items: selectedJadwal != null
                        ? jadwalList.map(
                            (e) {
                              var pendaftaran =
                                  controller.pendaftaranData.firstWhere(
                                (pendaftaran) =>
                                    pendaftaran.id == e.idPendaftaran,
                              );

                              var pasien = controller.pasienData.firstWhere(
                                (element) => element.id == pendaftaran.pasien,
                              );

                              return DropdownMenuItem(
                                value: e,
                                child: Text(
                                    '${pasien.namaLengkap} - ${pendaftaran.tanggal}'),
                              );
                            },
                          ).toList()
                        : [
                            DropdownMenuItem(
                              value: null,
                              child: Text("Tidak ada jadwal tersedia"),
                            ),
                          ],
                    onChanged: (value) {
                      setState(() {
                        selectedJadwal = value!;
                      });
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Text(
                    "Keluhan",
                    style: regular14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      hint: 'kepala Pusing', controller: keluhanController),
                  const SizedBox(
                    height: 20,
                  ),

                  Text(
                    "Kode Diagnosa",
                    style: regular14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      hint: 'J45', controller: kodeDiagnosaController),
                  const SizedBox(
                    height: 20,
                  ),

                  Text(
                    "Diagnosa",
                    style: regular14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      hint: 'Diagnosa kepada pasien (Sakit kepala migrain)',
                      controller: detailController),
                  const SizedBox(
                    height: 20,
                  ),

                  Text(
                    "Layanan lab radiologi",
                    style: regular14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButton2(
                    buttonStyleData: ButtonStyleData(
                        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          width: 2,
                          color: const Color(0xffC9C9C9).withOpacity(0.7)),
                    )),
                    isExpanded: true,
                    value: selectedPilihan,
                    items: [
                      DropdownMenuItem(
                        value: true,
                        child: Text('Ya'),
                      ),
                      DropdownMenuItem(
                        value: false,
                        child: Text('Tidak'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedPilihan = value!;
                        if (!selectedPilihan) {
                          selectedLayanan = LayananModel(
                              biayaLayanan: '0',
                              createdAt: '',
                              idLayanan: 0,
                              namaLayanan: '',
                              updatedAt: '');
                          // catatan.text = '-';
                        } else {
                          selectedLayanan = controller.layananList.first;
                        }
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  (selectedPilihan)
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Jenis layanan",
                              style: regular14,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            DropdownButton2(
                              buttonStyleData: ButtonStyleData(
                                  decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 2,
                                    color: const Color(0xffC9C9C9)
                                        .withOpacity(0.7)),
                              )),
                              isExpanded: true,
                              value: selectedLayanan,
                              items: controller.layananList.map((element) {
                                return DropdownMenuItem(
                                  value: element,
                                  child: Text(element.namaLayanan ?? 'null'),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedLayanan = value!;
                                });
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Prioritas",
                              style: regular14,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                                hint: 'Emergency, Urgent atau normal',
                                controller: prioritas),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Catatan",
                              style: regular14,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomTextField(
                                hint: 'Pemeriksaan segera diperlukan',
                                controller: catatan),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        )
                      : SizedBox(),

                  //tombol kirim
                  Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(5, 5),
                        ),
                      ]),
                      child: CustomButton(
                        onTap: () {
                          var lab = [
                            'Pemeriksaan Darah',
                            'Pemeriksaan MRI',
                            'Scan MCR',
                            'Scan USG',
                            'X-ray'
                          ];
                          var radiologi = ['Pemeriksaan Rontgen'];

                          String jenisPemeriksaan = 'Lab';

                          if (lab.contains(selectedLayanan.namaLayanan)) {
                            jenisPemeriksaan = 'Lab';
                          } else if (radiologi
                              .contains(selectedLayanan.namaLayanan)) {
                            jenisPemeriksaan = 'Radiologi';
                          } else {
                            jenisPemeriksaan = '-';
                          }

                          Diagnosa diagnosa = Diagnosa(
                              jenisLayanan:
                                  selectedLayanan.namaLayanan ?? 'null',
                              prioritas: prioritas.text,
                              catatan: catatan.text,
                              jenisPemeriksaan: jenisPemeriksaan,
                              idJadwal: selectedJadwal.idJadwal!,
                              tanggal: tanggalController.text,
                              kodeDiagnosa: kodeDiagnosaController.text,
                              detail: detailController.text,
                              keluhan: keluhanController.text);

                          controller.createDiagnosa(diagnosa);
                          Get.back();
                        },
                        color: mainColor,
                        child: Text(
                          'Tambah',
                          style: bold16,
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
