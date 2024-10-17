import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rawat_jalan/model/dokter_model.dart';
import 'package:rawat_jalan/model/pasien_model.dart';
import 'package:rawat_jalan/model/pendaftaran_model.dart';
import 'package:rawat_jalan/view/component/custom_button.dart';
import 'package:rawat_jalan/view/component/custom_textfield.dart';
import 'package:rawat_jalan/view/pages/admin/get/admin_controller.dart';
import 'package:rawat_jalan/view/style.dart';

class EditPendaftarannForm extends StatefulWidget {
  EditPendaftarannForm({super.key, required this.idPendaftaran});
  final idPendaftaran;
  final tanggalController = TextEditingController();
  final keluhanController = TextEditingController();

  @override
  State<EditPendaftarannForm> createState() => _EditPendaftarannFormState();
}

AdminController controller = Get.find<AdminController>();

class _EditPendaftarannFormState extends State<EditPendaftarannForm> {
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

  var pasienList = controller.pasienData.value;
  var dokterList = controller.dokterData.value;

  var selectedPasien = controller.pasienData.value.first;
  var selectedDokter = controller.dokterData.value.first;

  var admin = '';

  var status = 'Berjalan';
  var statusList = ['Berjalan', 'Selesai'];

  loadPendaftaranData() {
    var pendaftaran = controller.pendaftaranData
        .firstWhere((element) => element.id == widget.idPendaftaran);

    widget.tanggalController.text = pendaftaran.tanggal;
    widget.keluhanController.text = pendaftaran.keluhan;
    status = pendaftaran.status;

    if (controller.role == 'Dokter') {
      admin = controller.pendaftaranData.value
          .firstWhere(
            (element) => element.id == widget.idPendaftaran,
          )
          .admin;
    }
    selectedPasien = controller.pasienData
        .firstWhere((element) => element.id == pendaftaran.pasien);

    selectedDokter = controller.dokterData
        .firstWhere((element) => element.id == pendaftaran.dokter);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPendaftaranData();
  }

  @override
  void dispose() {
    super.dispose();
    widget.tanggalController.dispose();
    widget.keluhanController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var pasienList = controller

    return FutureBuilder(
      future: Future.delayed(
        const Duration(milliseconds: 300),
      ),
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
                Text("Edit Pendaftaran", style: bold24),
                const SizedBox(height: 30),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      (controller.role == 'Admin')
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Keluhan",
                                  style: regular14,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomTextField(
                                    hint: 'Demam tinggi',
                                    controller: widget.keluhanController),
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
                                        color: const Color(0xffC9C9C9)
                                            .withOpacity(0.7)),
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
                                  height: 10,
                                ),
                                Text(
                                  "Pilih Dokter",
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
                                  value: selectedDokter,
                                  items: dokterList.map(
                                    (e) {
                                      return DropdownMenuItem(
                                        value: e,
                                        child: Text(e.namaDokter),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      // Dokter selected = value as Dokter;
                                      selectedDokter = value!;
                                      print(selectedDokter);
                                    });
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            )
                          : const SizedBox(),

                      Text(
                        "Status",
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
                        value: status,
                        items: statusList.map(
                          (e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          setState(() {
                            print(value);
                            status = value!;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 40,
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
                              var currentDate = DateTime.now();
                              Pendaftaran pendaftaran = Pendaftaran(
                                dokter: selectedDokter.id!,
                                pasien: selectedPasien.id!,
                                admin: (controller.role == 'Admin')
                                    ? controller.adminData.value.idAdmin!
                                    : admin,
                                keluhan: widget.keluhanController.text,
                                status: status,
                                tanggal: DateFormat('yyyy-MM-dd')
                                    .format(currentDate),
                              );
                              controller.updatePendaftaran(
                                  pendaftaran, widget.idPendaftaran);
                              Get.back();
                            },
                            color: mainColor,
                            child: Text(
                              'Update',
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
