import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawat_jalan/model/diagnosa_model.dart';
import 'package:rawat_jalan/view/component/custom_button.dart';
import 'package:rawat_jalan/view/component/custom_textfield.dart';
import 'package:rawat_jalan/view/pages/admin/get/admin_controller.dart';
import 'package:rawat_jalan/view/style.dart';

class EditDiagnosaForm extends StatefulWidget {
  EditDiagnosaForm({
    super.key,
    required this.id,
  });

  String id;

  @override
  State<EditDiagnosaForm> createState() => _EditDiagnosaFormState();
}

AdminController controller = Get.find<AdminController>();

class _EditDiagnosaFormState extends State<EditDiagnosaForm> {
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

  @override
  initState() {
    super.initState();
    loadDiagnosaData();
  }

  loadDiagnosaData() {
    var diagnosa = controller.diagnosaList
        .firstWhere((element) => element.idDiagnosa == widget.id);

    tanggalController.text = diagnosa.tanggal;
    kodeDiagnosaController.text = diagnosa.kodeDiagnosa;
    detailController.text = diagnosa.detail;
    selectedPendaftaran = controller.pendaftaranData
        .firstWhere((element) => element.id == diagnosa.idPendaftaran);
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

  var pendaftaranList = controller.pendaftaranData
      .where((element) => element.dokter == controller.dokterUser.value.id);

  var selectedPendaftaran = controller.pendaftaranData
      .where((element) => element.dokter == controller.dokterUser.value.id)
      .first;

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

    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 200)),
      builder: (context, snapshot) {
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
                Text("Edit Diagnosa", style: bold24),
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
                        value: selectedPendaftaran,
                        items: pendaftaranList.map(
                          (e) {
                            var pasien = controller.pasienData.firstWhere(
                                (element) => element.id == e.pasien);
                            return DropdownMenuItem(
                              value: e,
                              child:
                                  Text('${pasien.namaLengkap} - ${e.keluhan}'),
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedPendaftaran = value!;
                          });
                        },
                      ),

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
                        "Detail",
                        style: regular14,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          hint: 'Sesak nafas hebat',
                          controller: detailController),
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
                              Diagnosa diagnosa = Diagnosa(
                                  idPendaftaran: selectedPendaftaran.id!,
                                  tanggal: tanggalController.text,
                                  kodeDiagnosa: kodeDiagnosaController.text,
                                  detail: detailController.text);

                              controller.updateDiagnosa(diagnosa, widget.id);
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
      },
    );
  }
}
