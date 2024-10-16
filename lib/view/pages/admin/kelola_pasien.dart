import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:rawat_jalan/model/dokter_model.dart';
import 'package:rawat_jalan/view/component/create_dokter_form.dart';
import 'package:rawat_jalan/view/component/create_pasien_form.dart';
import 'package:rawat_jalan/view/component/create_pendaftaran_form.dart';
import 'package:rawat_jalan/view/component/custom_button.dart';
import 'package:rawat_jalan/view/component/custom_textfield.dart';
import 'package:rawat_jalan/view/component/edit_dokter_form.dart';
import 'package:rawat_jalan/view/component/edit_pasien_form.dart';
import 'package:rawat_jalan/view/component/edit_pendaftaran_form.dart';
import 'package:rawat_jalan/view/pages/admin/get/admin_controller.dart';
import 'package:rawat_jalan/view/style.dart';

class KelolaPasienPage extends StatefulWidget {
  KelolaPasienPage({super.key});

  @override
  State<KelolaPasienPage> createState() => _KelolaPasienPageState();
}

class _KelolaPasienPageState extends State<KelolaPasienPage> {
  var controller = Get.find<AdminController>();

  int calculateAge(String birthdateString) {
    DateTime birthdate = DateTime.parse(birthdateString);
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthdate.year;

    if (currentDate.month < birthdate.month ||
        (currentDate.month == birthdate.month &&
            currentDate.day < birthdate.day)) {
      age--;
    }
    return age;
  }

  TextEditingController NPI = TextEditingController();

  // TextEditingController namaDokter = TextEditingController();

  // // TextEditingController jenisKelamin = TextEditingController();
  // var jenisKelamin = 'Laki-laki'.obs;

  // TextEditingController spesialisasi = TextEditingController();

  // TextEditingController alamat = TextEditingController();

  // TextEditingController tanggalLahir = TextEditingController();

  // TextEditingController email = TextEditingController();
  // var statusLisensi = 'Aktif'.obs;

  // TextEditingController tanggalLisensi = TextEditingController();

  // TextEditingController namaInstitusi = TextEditingController();

  // TextEditingController password = TextEditingController();
  // TextEditingController noTelp = TextEditingController();

  List<String> gender = ['Laki-laki', 'Perempuan'];
  List<String> status = ['Aktif', 'Tidak Aktif'];

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

  void openFormDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CreatePasienForm();
        });
  }

  @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   NPI.dispose();
  //   namaDokter.dispose();
  //   spesialisasi.dispose();
  //   alamat.dispose();
  //   tanggalLahir.dispose();
  //   email.dispose();
  //   tanggalLisensi.dispose();
  //   namaInstitusi.dispose();
  //   password.dispose();
  //   noTelp.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                'Kelola Pasien',
                style: bold31,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 500,
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
                      'Data Pasien',
                      style: bold20,
                    ),
                    (controller.role == 'Admin')
                        ? ElevatedButton(
                            onPressed: () {
                              openFormDialog(context);
                            },
                            child: const Row(
                              children: [
                                Icon(Icons.add_rounded),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Tambah')
                              ],
                            ))
                        : const SizedBox(),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                if (controller.dokterData.isNotEmpty) {
                  return DataTable(
                    columns: [
                      DataColumn(
                          label: Text(
                        'Nama Lengkap',
                        style: bold10.copyWith(fontSize: 12),
                      )),
                      DataColumn(
                          label: Text('Panggilan',
                              style: bold10.copyWith(fontSize: 12))),
                      DataColumn(
                          label: Text('Jenis Kelamin',
                              style: bold10.copyWith(fontSize: 12))),
                      DataColumn(
                          label: Text('Alamat',
                              style: bold10.copyWith(fontSize: 12))),
                      DataColumn(
                          label: Text('Tanggal Lahir',
                              style: bold10.copyWith(fontSize: 12))),
                      DataColumn(
                          label: Text('Tempat Lahir',
                              style: bold10.copyWith(fontSize: 12))),
                      DataColumn(
                          label: Text('Agama',
                              style: bold10.copyWith(fontSize: 12))),
                      DataColumn(
                          label: Text('Umur',
                              style: bold10.copyWith(fontSize: 12))),
                      DataColumn(
                          label: Text('No telp',
                              style: bold10.copyWith(fontSize: 12))),
                      DataColumn(
                          label: Text('Action',
                              style: bold10.copyWith(fontSize: 12))),
                    ],
                    rows: controller.pasienData.value.map((pasien) {
                      return DataRow(
                        cells: [
                          DataCell(Text(pasien.namaLengkap)),
                          DataCell(Text(pasien.namaPanggilan)),
                          DataCell(Text(pasien.jenisKelamin)),
                          DataCell(Text(pasien.alamat)),
                          DataCell(Text(pasien.tanggalLahir)),
                          DataCell(Text(pasien.tempatLahir)),
                          DataCell(Text(pasien.agama)),
                          DataCell(Text(
                              '${calculateAge('${pasien.tanggalLahir}')}')),
                          DataCell(Text(pasien.noTelp)),
                          DataCell(Row(
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return EditPasienForm(
                                              idPasien: pasien.id);
                                        });
                                  },
                                  child: const Icon(Icons.edit)),
                              const SizedBox(
                                width: 5,
                              ),
                              (controller.role == 'Admin')
                                  ? ElevatedButton(
                                      onPressed: () {
                                        controller.deletePasien(pasien.id!);
                                      },
                                      child: const Icon(Icons.delete))
                                  : const SizedBox()
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
          height: 40,
        ),
        (controller.role == 'Admin')
            ? Container(
                height: 500,
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
                padding: const EdgeInsets.fromLTRB(40, 40, 40, 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Pendaftaran Rawat Jalan',
                            style: bold20,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          (controller.role == "Admin")
                              ? ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return CreatePendaftarannForm();
                                      },
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
                                  ))
                              : const SizedBox(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() {
                      if (controller.dokterData.isNotEmpty) {
                        return DataTable(
                          columns: [
                            DataColumn(
                                label: Text(
                              'Nama Pasien',
                              style: bold10.copyWith(fontSize: 12),
                            )),
                            DataColumn(
                                label: Text('Dokter',
                                    style: bold10.copyWith(fontSize: 12))),
                            DataColumn(
                                label: Text('Tanggal Pendaftaran',
                                    style: bold10.copyWith(fontSize: 12))),
                            DataColumn(
                                label: Text('Keluhan',
                                    style: bold10.copyWith(fontSize: 12))),
                            DataColumn(
                                label: Text('Status',
                                    style: bold10.copyWith(fontSize: 12))),
                            DataColumn(
                                label: Text(
                              'Admin',
                              style: bold10.copyWith(fontSize: 12),
                            )),
                            DataColumn(
                                label: Text('Action',
                                    style: bold10.copyWith(fontSize: 12))),
                          ],
                          rows: controller.pendaftaranData.value.map((data) {
                            return DataRow(
                              cells: [
                                DataCell(Text(controller.pasienData.value
                                    .firstWhere(
                                      (element) => element.id == data.pasien,
                                    )
                                    .namaLengkap)),
                                DataCell(Text(controller.listAdmin.value
                                    .firstWhere(
                                      (element) =>
                                          element.idAdmin == data.admin,
                                    )
                                    .nama)),
                                DataCell(Text(data.tanggal)),
                                DataCell(Text(data.keluhan)),

                                DataCell(Text(data.status)),
                                DataCell(Text(controller.listAdmin.value
                                    .firstWhere(
                                      (element) =>
                                          element.idAdmin == data.admin,
                                    )
                                    .nama)),
                                DataCell(Row(
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return EditPendaftarannForm(
                                                    idPendaftaran: data.id);
                                              });
                                        },
                                        child: const Icon(Icons.edit)),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          controller
                                              .deletePendaftaran(data.id!);
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
              )
            : const SizedBox()
      ],
    );
  }
}
