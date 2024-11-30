import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rawat_jalan/view/style.dart';

import 'get/admin_controller.dart';

class OverviewPage extends StatefulWidget {
  OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  final controller = Get.find<AdminController>();

  int calculateAge(String birthdateString) {
    DateTime birthdate = DateFormat("yyyy-MM-dd").parse(birthdateString);
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthdate.year;

    if (currentDate.month < birthdate.month ||
        (currentDate.month == birthdate.month &&
            currentDate.day < birthdate.day)) {
      age--;
    }
    return age;
  }

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    var deviceHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: GetBuilder<AdminController>(
              init: controller,
              builder: (_) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            'Dashboard',
                            style: bold31,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        InfoPhil(
                          gradient: const LinearGradient(
                              colors: [Color(0xff456fe8), Color(0xff19b0ec)]),
                          count: controller.dokterData.isNotEmpty
                              ? controller.dokterData.length.toString()
                              : '-',
                          title: 'Total Dokter saat ini',
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InfoPhil(
                          gradient: const LinearGradient(
                              colors: [Color(0xffe763f9), Color(0xfff2c2ee)]),
                          count: controller.pasienData.isNotEmpty
                              ? controller.pasienData.length.toString()
                              : '-',
                          title: 'Total pasien saat ini',
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InfoPhil(
                          gradient: const LinearGradient(
                              colors: [Color(0xfff97d5b), Color(0xfff9a87b)]),
                          count: controller.pendaftaranData.isNotEmpty
                              ? controller.pendaftaranData.length.toString()
                              : '-',
                          title: 'Total pendaftar rawat jalan',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: deviceWidth * 0.7,
                      height: deviceHeight * 0.7,
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
                          Text(
                            'Data Pasien',
                            style: bold20,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          DataTable(
                            columns: [
                              DataColumn(
                                  label: Text(
                                'Nama Lengkap',
                                style: bold10.copyWith(fontSize: 12),
                              )),
                              DataColumn(
                                  label: Text('Nama Panggilan',
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

                              // Add more columns as needed
                            ],
                            rows: controller.pasienData.map((pasien) {
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
                                  // Add more cells as needed
                                ],
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: deviceHeight * 0.7,
                      width: deviceWidth * 0.7,
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
                          Text(
                            'Data Dokter',
                            style: bold20,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: ListView(
                              children: [
                                DataTable(
                                  columns: [
                                    DataColumn(
                                        label: Text('NPI',
                                            style:
                                                bold10.copyWith(fontSize: 12))),
                                    DataColumn(
                                        label: Text('Nama',
                                            style:
                                                bold10.copyWith(fontSize: 12))),
                                    DataColumn(
                                        label: Text('Kelamin',
                                            style:
                                                bold10.copyWith(fontSize: 12))),
                                    DataColumn(
                                        label: Text('Alamat',
                                            style:
                                                bold10.copyWith(fontSize: 12))),
                                    DataColumn(
                                        label: Text('Tgl lahir',
                                            style:
                                                bold10.copyWith(fontSize: 12))),
                                    DataColumn(
                                        label: Text('Spesialisasi',
                                            style:
                                                bold10.copyWith(fontSize: 12))),
                                    DataColumn(
                                        label: Text('Umur',
                                            style:
                                                bold10.copyWith(fontSize: 12))),
                                    DataColumn(
                                        label: Text('No telp',
                                            style:
                                                bold10.copyWith(fontSize: 12))),
                                    // DataColumn(
                                    //     label: Text('Lisensi',
                                    //         style: bold10.copyWith(fontSize: 12)))
                                    // Add more columns as needed
                                  ],
                                  rows:
                                      controller.dokterData.value.map((dokter) {
                                    return DataRow(
                                      cells: [
                                        DataCell(Text(dokter.nPI ?? 'null')),
                                        DataCell(Text(dokter.nama ?? 'null')),
                                        DataCell(Text(
                                            dokter.jenisKelamin ?? 'null')),
                                        DataCell(Text(dokter.alamat ?? 'null')),
                                        DataCell(Text(
                                            dokter.tanggalLahir ?? 'null')),
                                        DataCell(Text(
                                            dokter.spesialisasi ?? 'null')),
                                        DataCell(Text(
                                            '${calculateAge(dokter.tanggalLahir!)}')),
                                        DataCell(Text(dokter.noHp ?? 'null')),
                                        // DataCell(Text(dokter.statusLisensi)),

                                        // Add more cells as needed
                                      ],
                                    );
                                  }).toList(),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            )));
  }
}

class InfoPhil extends StatelessWidget {
  const InfoPhil(
      {super.key,
      this.color,
      this.gradient,
      required this.count,
      required this.title});

  final Color? color;
  final Gradient? gradient;
  final String count;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 367,
      height: 200,
      decoration: BoxDecoration(
        gradient: gradient,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 5))
        ],
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: regular14.copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                count,
                style: bold31.copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Orang',
                style: bold14.copyWith(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
