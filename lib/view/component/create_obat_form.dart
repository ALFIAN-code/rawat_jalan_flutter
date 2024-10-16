import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawat_jalan/model/jadwal_model.dart';
import 'package:rawat_jalan/model/obat_model.dart';
import 'package:rawat_jalan/view/component/custom_button.dart';
import 'package:rawat_jalan/view/component/custom_textfield.dart';
import 'package:rawat_jalan/view/pages/admin/get/admin_controller.dart';
import 'package:rawat_jalan/view/style.dart';

class CreateObatForm extends StatefulWidget {
  CreateObatForm({
    super.key,
    required this.resepId,
  });

  String resepId;

  @override
  State<CreateObatForm> createState() => _CreateObatFormState();
}

AdminController controller = Get.find<AdminController>();

class _CreateObatFormState extends State<CreateObatForm> {
  TextEditingController namaObat = TextEditingController();
  TextEditingController jenisObat = TextEditingController();
  TextEditingController dosis = TextEditingController();
  TextEditingController rutePemberian = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    jenisObat.dispose();
    dosis.dispose();
    rutePemberian.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(40, 30, 40, 10),
        width: 800,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Tambah Pendaftaran", style: bold24),
            const SizedBox(height: 30),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    "Nama Obat",
                    style: regular14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(hint: 'Paracetamol', controller: namaObat),
                  const SizedBox(
                    height: 20,
                  ),

                  Text(
                    "Jenis Obat",
                    style: regular14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(hint: 'Analgesik', controller: jenisObat),
                  const SizedBox(
                    height: 20,
                  ),

                  Text(
                    "Dosis",
                    style: regular14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(hint: '2x1', controller: dosis),
                  const SizedBox(
                    height: 20,
                  ),

                  Text(
                    "Rute Pemberian",
                    style: regular14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      hint: 'ruang a301', controller: rutePemberian),
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
                          print(namaObat.text);
                          print(jenisObat.text);
                          print(dosis.text);
                          print(rutePemberian.text);

                          Obat obat = Obat(
                            namaObat: namaObat.text,
                            jenisObat: jenisObat.text,
                            dosis: dosis.text,
                            rutePemberian: rutePemberian.text,
                            idResep: widget.resepId,
                          );
                          controller.createObat(obat);
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
