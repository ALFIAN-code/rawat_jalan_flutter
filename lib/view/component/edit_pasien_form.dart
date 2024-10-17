import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawat_jalan/model/pasien_model.dart';
import 'package:rawat_jalan/view/component/custom_button.dart';
import 'package:rawat_jalan/view/component/custom_textfield.dart';
import 'package:rawat_jalan/view/pages/admin/get/admin_controller.dart';
import 'package:rawat_jalan/view/style.dart';

class EditPasienForm extends StatefulWidget {
  EditPasienForm({super.key, required this.idPasien});

  final TextEditingController idEksternalController = TextEditingController();
  final TextEditingController namaLengkapController = TextEditingController();
  final TextEditingController namaPanggilanController = TextEditingController();
  final TextEditingController namaIbuPasienController = TextEditingController();
  var jenisKelamin = 'Laki-laki'.obs;
  final TextEditingController tanggalLahirController = TextEditingController();
  final TextEditingController tempatLahirController = TextEditingController();
  final TextEditingController agamaController = TextEditingController();
  final TextEditingController rasController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController kodeNegaraController = TextEditingController();
  final TextEditingController noTelpController = TextEditingController();
  final TextEditingController bahasaUtamaController = TextEditingController();
  var statusPernikahan = 'Menikah'.obs;
  final TextEditingController noRekeningController = TextEditingController();
  final TextEditingController noSimController = TextEditingController();
  final TextEditingController kelompokEtnisController = TextEditingController();
  var kelahiranKembar = 'Tidak'.obs;
  final TextEditingController indikatorMeninggalController =
      TextEditingController();
  final TextEditingController kewarganegaraanController =
      TextEditingController();
  var statusMiliter = 'Ada'.obs;
  final TextEditingController tanggalPasienMeninggalController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final List<String> gender = ['Laki-laki', 'Perempuan'];
  final List<String> kelahiranKembarList = ['Tidak', 'iya'];
  final List<String> statusPernikahanList = ['Menikah', 'Belum Menikah'];
  final List<String> statusMiliterList = ['Ada', 'Tidak Ada'];

  final idPasien;

  @override
  State<EditPasienForm> createState() => _EditPasienFormState();
}

class _EditPasienFormState extends State<EditPasienForm> {
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

  void loadPasienData() {
    var pasien = controller.pasienData
        .firstWhere((element) => element.id == widget.idPasien);

    widget.idEksternalController.text = pasien.idEksternal;
    widget.namaLengkapController.text = pasien.namaLengkap;
    widget.namaPanggilanController.text = pasien.namaPanggilan;
    widget.namaIbuPasienController.text = pasien.namaIbu;
    widget.jenisKelamin.value = pasien.jenisKelamin;
    widget.tanggalLahirController.text = pasien.tanggalLahir;
    widget.tempatLahirController.text = pasien.tempatLahir;
    widget.agamaController.text = pasien.agama;
    widget.rasController.text = pasien.ras;
    widget.alamatController.text = pasien.alamat;
    widget.kodeNegaraController.text = pasien.kodeNegara;
    widget.noTelpController.text = pasien.noTelp;
    widget.bahasaUtamaController.text = pasien.bahasaUtama;
    widget.statusPernikahan.value = pasien.statusPernikahan;
    widget.noRekeningController.text = pasien.noRekening;
    widget.noSimController.text = pasien.noSim;
    widget.kelompokEtnisController.text = pasien.kelompokEtnis;
    widget.kelahiranKembar.value = pasien.kelahiranKembar;
    widget.indikatorMeninggalController.text = pasien.indikatorMeninggal ?? '';
    widget.kewarganegaraanController.text = pasien.kewarganegaraan;
    widget.statusMiliter.value = pasien.statusMiliter;
    widget.tanggalPasienMeninggalController.text =
        pasien.tanggalMeninggal ?? '';
    widget.statusPernikahan.value = pasien.statusPernikahan;
  }

  @override
  void dispose() {
    super.dispose();
    widget.agamaController.dispose();
    widget.alamatController.dispose();
    widget.bahasaUtamaController.dispose();
    widget.idEksternalController.dispose();
    widget.indikatorMeninggalController.dispose();
    widget.kelompokEtnisController.dispose();
    widget.kewarganegaraanController.dispose();
    widget.kodeNegaraController.dispose();
    widget.namaIbuPasienController.dispose();
    widget.namaLengkapController.dispose();
    widget.namaPanggilanController.dispose();
    widget.noRekeningController.dispose();
    widget.noSimController.dispose();
    widget.noTelpController.dispose();
    widget.passwordController.dispose();
    widget.rasController.dispose();
    widget.tanggalLahirController.dispose();
    widget.tanggalPasienMeninggalController.dispose();
    widget.tempatLahirController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 300), () {
        return loadPasienData();
      }),
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
                Text("Edit Pasien", style: bold24),
                const SizedBox(height: 30),
                Flexible(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Text(
                        "ID External",
                        style: regular14,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          hint: '012********',
                          controller: widget.idEksternalController),
                      const SizedBox(
                        height: 20,
                      ),

                      Text(
                        "Nama Lengkap",
                        style: regular14,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          hint: "john doe",
                          controller: widget.namaLengkapController),
                      const SizedBox(
                        height: 20,
                      ),

                      Text(
                        "Nama Panggilan",
                        style: regular14,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          hint: 'john',
                          controller: widget.namaPanggilanController),
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
                        "Nomor Telfon",
                        style: regular14,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          hint: '0815********',
                          controller: widget.noTelpController),
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
                          controller: widget.alamatController),
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
                          controller: widget.tanggalLahirController,
                          readOnly: true,
                          onTap: () async {
                            String date = await _selectDate(
                                context, widget.tanggalLahirController);
                            setState(() {
                              widget.tanggalLahirController.text = date;
                            });
                          }),
                      const SizedBox(
                        height: 20,
                      ),

                      Text(
                        "Tempat Lahir",
                        style: regular14,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          hint: 'Surabaya',
                          controller: widget.tempatLahirController),
                      const SizedBox(
                        height: 20,
                      ),

                      Text(
                        "Agama",
                        style: regular14,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          hint: 'Islam', controller: widget.agamaController),
                      const SizedBox(
                        height: 20,
                      ),

                      Text(
                        "Ras",
                        style: regular14,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          hint: 'Asia', controller: widget.rasController),
                      const SizedBox(
                        height: 20,
                      ),

                      Text(
                        "Nama Ibu",
                        style: regular14,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          hint: 'Sri Utami',
                          controller: widget.namaIbuPasienController),
                      const SizedBox(
                        height: 20,
                      ),

                      Text(
                        "kode negara",
                        style: regular14,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          hint: '62', controller: widget.kodeNegaraController),
                      const SizedBox(
                        height: 20,
                      ),

                      Text(
                        "bahasa Utama",
                        style: regular14,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          hint: 'Indonesia',
                          controller: widget.bahasaUtamaController),
                      const SizedBox(
                        height: 20,
                      ),

                      Text(
                        "Status Pernikahan",
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
                          value: widget.statusPernikahan.value,
                          items: widget.statusPernikahanList.map(
                            (e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            widget.statusPernikahan.value = value.toString();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      Text(
                        "No Rekening",
                        style: regular14,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          hint: '5678************',
                          controller: widget.noRekeningController),
                      const SizedBox(
                        height: 20,
                      ),

                      Text(
                        "No Sim",
                        style: regular14,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          hint: '9788*********',
                          controller: widget.noSimController),
                      const SizedBox(
                        height: 20,
                      ),

                      Text(
                        "Kelompok Etnis",
                        style: regular14,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          hint: 'Madura',
                          controller: widget.kelompokEtnisController),
                      const SizedBox(
                        height: 20,
                      ),

                      Text(
                        "Kelahiran Kembar",
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
                          value: widget.kelahiranKembar.value,
                          items: widget.kelahiranKembarList.map(
                            (e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            widget.statusPernikahan.value = value.toString();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      Text(
                        "Indikator Meninggal",
                        style: regular14,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          hint: 'Kulit pucat, Denyut nadi',
                          controller: widget.indikatorMeninggalController),
                      const SizedBox(
                        height: 20,
                      ),

                      Text(
                        "kewarganegaraan",
                        style: regular14,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          hint: 'Indonesia',
                          controller: widget.kewarganegaraanController),
                      const SizedBox(
                        height: 20,
                      ),

                      Text(
                        "Status Militer",
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
                          value: widget.statusMiliter.value,
                          items: widget.statusMiliterList.map(
                            (e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            widget.statusMiliter.value = value.toString();
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      Text(
                        "Tanggal Passien Meninggal",
                        style: regular14,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                                hint: 'hint',
                                controller:
                                    widget.tanggalPasienMeninggalController,
                                readOnly: true,
                                onTap: () async {
                                  String date = await _selectDate(context,
                                      widget.tanggalPasienMeninggalController);
                                  setState(() {
                                    widget.tanggalPasienMeninggalController
                                        .text = date;
                                  });
                                }),
                          ),
                          IconButton(
                              onPressed: () {
                                widget.tanggalLahirController.clear();
                              },
                              icon: const Icon(Icons.clear_rounded))
                        ],
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
                              Pasien pasien = Pasien(
                                namaIbu: widget.namaIbuPasienController.text,
                                idEksternal: widget.idEksternalController.text,
                                namaLengkap: widget.namaLengkapController.text,
                                namaPanggilan:
                                    widget.namaPanggilanController.text,
                                jenisKelamin: widget.jenisKelamin.value,
                                noTelp: widget.noTelpController.text,
                                alamat: widget.alamatController.text,
                                tanggalLahir:
                                    widget.tanggalLahirController.text,
                                tempatLahir: widget.tempatLahirController.text,
                                agama: widget.agamaController.text,
                                ras: widget.rasController.text,
                                kodeNegara: widget.kodeNegaraController.text,
                                bahasaUtama: widget.bahasaUtamaController.text,
                                statusPernikahan: widget.statusPernikahan.value,
                                noRekening: widget.noRekeningController.text,
                                noSim: widget.noSimController.text,
                                kelompokEtnis:
                                    widget.kelompokEtnisController.text,
                                kelahiranKembar: widget.kelahiranKembar.value,
                                indikatorMeninggal:
                                    widget.indikatorMeninggalController.text,
                                kewarganegaraan:
                                    widget.kewarganegaraanController.text,
                                statusMiliter: widget.statusMiliter.value,
                                tanggalMeninggal: widget
                                    .tanggalPasienMeninggalController.text,
                              );
                              controller.updatePasien(pasien, widget.idPasien);
                              Get.back();
                            },
                            color: mainColor,
                            child: Text(
                              'Update',
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
