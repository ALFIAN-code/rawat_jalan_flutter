import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawat_jalan/model/dokter_model.dart';
import 'package:rawat_jalan/view/component/custom_button.dart';
import 'package:rawat_jalan/view/component/custom_textfield.dart';
import 'package:rawat_jalan/view/pages/admin/get/admin_controller.dart';
import 'package:rawat_jalan/view/style.dart';

class CreateDokterForm extends StatefulWidget {
  CreateDokterForm(
      {super.key,
      required this.NPI,
      required this.alamat,
      required this.email,
      required this.jenisKelamin,
      required this.namaDokter,
      required this.namaInstitusi,
      required this.noTelp,
      required this.password,
      required this.spesialisasi,
      required this.statusLisensi,
      required this.tanggalLahir,
      required this.tanggalLisensi});

  TextEditingController NPI;
  TextEditingController namaDokter;
  RxString jenisKelamin;
  TextEditingController spesialisasi;
  TextEditingController alamat;
  TextEditingController tanggalLahir;
  TextEditingController email;
  RxString statusLisensi;
  TextEditingController tanggalLisensi;
  TextEditingController namaInstitusi;
  TextEditingController password;
  TextEditingController noTelp;

  final List<String> gender = ['Laki-laki', 'Perempuan'];
  final List<String> status = ['Aktif', 'Tidak Aktif'];

  @override
  State<CreateDokterForm> createState() => _CreateDokterFormState();
}

class _CreateDokterFormState extends State<CreateDokterForm> {
  AdminController controller = Get.find<AdminController>();
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
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.NPI.dispose();
    widget.namaDokter.dispose();
    widget.spesialisasi.dispose();
    widget.alamat.dispose();
    widget.tanggalLahir.dispose();
    widget.email.dispose();
    widget.tanggalLisensi.dispose();
    widget.namaInstitusi.dispose();
    widget.password.dispose();
    widget.noTelp.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            Text("Tambah Dokter", style: bold24),
            const SizedBox(height: 20),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    "NPI",
                    style: regular14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(hint: '012********', controller: widget.NPI),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Nama Dokter",
                    style: regular14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      hint: "Dr. john doe", controller: widget.namaDokter),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Jenis Kelamin",
                    style: regular14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => DropdownButton2(
                      buttonStyleData: ButtonStyleData(
                          decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 2,
                            color: const Color(0xffC9C9C9).withOpacity(0.7)),
                      )),
                      isExpanded: true,
                      value: widget.jenisKelamin.value,
                      items: widget.gender.map(
                        (e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        widget.jenisKelamin.value = value.toString();
                        print("Jenis kelamin: ${widget.jenisKelamin}");
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Spesialisasi",
                    style: regular14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      hint: 'Penyakit dalam', controller: widget.spesialisasi),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Nomor Telfon",
                    style: regular14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      hint: '0815********', controller: widget.noTelp),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Alamat",
                    style: regular14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      hint: "Jl. panjasila, Sukolilo, Surabaya",
                      controller: widget.alamat),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Tanggal lahir",
                    style: regular14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      hint: 'hint',
                      controller: widget.tanggalLahir,
                      readOnly: true,
                      onTap: () async {
                        String date =
                            await _selectDate(context, widget.tanggalLahir);
                        setState(() {
                          widget.tanggalLahir.text = date;
                        });
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Email",
                    style: regular14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      hint: 'example@mail.com', controller: widget.email),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Status Lisensi",
                    style: regular14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(
                    () => DropdownButton2(
                      buttonStyleData: ButtonStyleData(
                          decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 2,
                            color: const Color(0xffC9C9C9).withOpacity(0.7)),
                      )),
                      isExpanded: true,
                      value: widget.statusLisensi.value,
                      items: widget.status.map(
                        (e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        widget.statusLisensi.value = value.toString();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Tanggal Lisensi",
                    style: regular14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      hint: '',
                      controller: widget.tanggalLisensi,
                      readOnly: true,
                      onTap: () async {
                        String date =
                            await _selectDate(context, widget.tanggalLahir);
                        setState(() {
                          widget.tanggalLisensi.text = date;
                        });
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Nama Institusi",
                    style: regular14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      hint: 'PENS Hospital', controller: widget.namaInstitusi),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Password",
                    style: regular14,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                      hint: '********',
                      controller: widget.password,
                      obscureText: false),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
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
                    Dokter dokter = Dokter(
                      npi: widget.NPI.text,
                      namaDokter: widget.namaDokter.text,
                      spesialisasi: widget.spesialisasi.text,
                      jenisKelamin: widget.jenisKelamin.value,
                      noTelp: widget.noTelp.text,
                      alamat: widget.alamat.text,
                      tanggalLahir: widget.tanggalLahir.text,
                      email: widget.email.text,
                      statusLisensi: widget.statusLisensi.value,
                      tanggalLisensi: widget.tanggalLisensi.text,
                      namaInstitusi: widget.namaInstitusi.text,
                      password: widget.password.text,
                    );
                    controller.createDokter(dokter.toJson());
                    Get.back();
                  },
                  color: mainColor,
                  child: Text(
                    'Tambah',
                    style: bold16,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
