import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawat_jalan/model/dokter_model.dart';
import 'package:rawat_jalan/view/component/custom_button.dart';
import 'package:rawat_jalan/view/component/custom_textfield.dart';
import 'package:rawat_jalan/view/pages/admin/get/admin_controller.dart';
import 'package:rawat_jalan/view/style.dart';

class EditDokterForm extends StatefulWidget {
  EditDokterForm({super.key, required this.idDokter});

  String idDokter;
  TextEditingController NPI = TextEditingController();
  TextEditingController namaDokter = TextEditingController();
  RxString jenisKelamin = 'Laki-laki'.obs;
  TextEditingController spesialisasi = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController tanggalLahir = TextEditingController();
  TextEditingController email = TextEditingController();
  RxString statusLisensi = 'Aktif'.obs;
  TextEditingController tanggalLisensi = TextEditingController();
  TextEditingController namaInstitusi = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController noTelp = TextEditingController();

  final List<String> gender = ['Laki-laki', 'Perempuan'];
  final List<String> status = ['Aktif', 'Tidak Aktif'];

  @override
  State<EditDokterForm> createState() => _EditDokterFormState();
}

class _EditDokterFormState extends State<EditDokterForm> {
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

  void loadDokterData() {
    var dokter = controller.dokterData
        .firstWhere((element) => element.id == widget.idDokter);
    widget.NPI.text = dokter.npi;
    widget.namaDokter.text = dokter.namaDokter;
    widget.jenisKelamin.value = dokter.jenisKelamin;
    widget.spesialisasi.text = dokter.spesialisasi;
    widget.alamat.text = dokter.alamat;
    widget.tanggalLahir.text = dokter.tanggalLahir;
    widget.email.text = dokter.email;
    widget.statusLisensi.value = dokter.statusLisensi;
    widget.tanggalLisensi.text = dokter.tanggalLisensi;
    widget.namaInstitusi.text = dokter.namaInstitusi;
    widget.password.text = dokter.password;
    widget.noTelp.text = dokter.noTelp;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadDokterData();
  }

  @override
  void dispose() {
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
    return FutureBuilder(
      future: Future.delayed(
        const Duration(milliseconds: 500),
        () => loadDokterData(),
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
                Text("Edit Dokter", style: bold24),
                const SizedBox(height: 30),
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
                      CustomTextField(
                          hint: '012********', controller: widget.NPI),
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
                                color:
                                    const Color(0xffC9C9C9).withOpacity(0.7)),
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
                          hint: 'Penyakit dalam',
                          controller: widget.spesialisasi),
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
                                color:
                                    const Color(0xffC9C9C9).withOpacity(0.7)),
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
                          hint: 'PENS Hospital',
                          controller: widget.namaInstitusi),
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
                              controller.updateDokter(widget.idDokter, dokter);
                              Get.back();
                            },
                            color: mainColor,
                            child: Text(
                              'Ubah',
                              style: bold16,
                            ),
                          ))
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
