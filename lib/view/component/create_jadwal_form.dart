import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawat_jalan/model/jadwal_model.dart';
import 'package:rawat_jalan/view/component/custom_button.dart';
import 'package:rawat_jalan/view/component/custom_textfield.dart';
import 'package:rawat_jalan/view/pages/admin/get/admin_controller.dart';
import 'package:rawat_jalan/view/style.dart';

class CreateJadwalForm extends StatefulWidget {
  const CreateJadwalForm({
    super.key,
  });

  @override
  State<CreateJadwalForm> createState() => _CreateJadwalFormState();
}

AdminController controller = Get.find<AdminController>();

class _CreateJadwalFormState extends State<CreateJadwalForm> {
  Future<String> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1800),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      return "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
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
  TextEditingController waktuMulaiController = TextEditingController();
  TextEditingController waktuSelesaiController = TextEditingController();

  var pasienList = controller.pasienData.value;

  var pendaftaranList = controller.pendaftaranData.value;
  var ruanganList = controller.listRuangan.value;

  var selectedPasien = controller.pasienData.value.first;
  var selectedRuangan = controller.listRuangan.value.first;

  @override
  void dispose() {
    super.dispose();
    tanggalController.dispose();
    waktuMulaiController.dispose();
    waktuSelesaiController.dispose();
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
            Text("Tambah Jadwal", style: bold24),
            const SizedBox(height: 30),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    "Ruangan",
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
                    value: selectedRuangan,
                    items: ruanganList.map(
                      (e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e.namaRuangan),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        // Dokter selected = value as Dokter;
                        selectedRuangan = value!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),

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
                    "waktu mulai",
                    style: regular14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      hint: '08:00',
                      controller: waktuMulaiController,
                      readOnly: true,
                      onTap: () async {
                        String time = await _selectTime(context);
                        setState(() {
                          waktuMulaiController.text = time;
                        });
                      }),
                  const SizedBox(
                    height: 20,
                  ),

                  Text(
                    "waktu Selesai",
                    style: regular14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      hint: '09:00',
                      controller: waktuSelesaiController,
                      readOnly: true,
                      onTap: () async {
                        String time = await _selectTime(context);
                        setState(() {
                          waktuSelesaiController.text = time;
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
                    value: selectedPasien,
                    items: pasienList.map(
                      (e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e.namaLengkap),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        // widget.selectedPasien = value;
                        // Pasien selected = value as Pasien;
                        selectedPasien = value!;
                      });
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),

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
                          Jadwal jadwal = Jadwal(
                              idRuangan: selectedRuangan.idRuangan,
                              idPendaftaran: controller.pendaftaranData
                                  .firstWhere((element) =>
                                      element.pasien == selectedPasien.id)
                                  .id!,
                              tanggal: tanggalController.text,
                              waktuMulai: waktuMulaiController.text,
                              waktuSelesai: waktuSelesaiController.text);

                          controller.createJadwal(jadwal);
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
