import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:rawat_jalan/model/dokter_model.dart';
import 'package:rawat_jalan/view/component/custom_button.dart';
import 'package:rawat_jalan/view/component/custom_textfield.dart';
import 'package:rawat_jalan/view/pages/admin/get/admin_controller.dart';
import 'package:rawat_jalan/view/style.dart';

class KelolaDokterPage extends StatefulWidget {
  KelolaDokterPage({super.key});

  @override
  State<KelolaDokterPage> createState() => _KelolaDokterPageState();
}

class _KelolaDokterPageState extends State<KelolaDokterPage> {
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

  TextEditingController namaDokter = TextEditingController();

  // TextEditingController jenisKelamin = TextEditingController();
  var jenisKelamin = 'Laki-laki'.obs;

  TextEditingController spesialisasi = TextEditingController();

  TextEditingController alamat = TextEditingController();

  TextEditingController tanggalLahir = TextEditingController();

  TextEditingController email = TextEditingController();
  var statusLisensi = 'Aktif'.obs;

  TextEditingController tanggalLisensi = TextEditingController();

  TextEditingController namaInstitusi = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController noTelp = TextEditingController();

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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    NPI.dispose();
    namaDokter.dispose();
    spesialisasi.dispose();
    alamat.dispose();
    tanggalLahir.dispose();
    email.dispose();
    tanggalLisensi.dispose();
    namaInstitusi.dispose();
    password.dispose();
    noTelp.dispose();
  }

  void openFormDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
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
                      CustomTextField(hint: '012********', controller: NPI),
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
                          hint: "Dr. john doe", controller: namaDokter),
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
                          value: jenisKelamin.value,
                          items: gender.map(
                            (e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            jenisKelamin.value = value.toString();
                            print("Jenis kelamin: $jenisKelamin");
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
                          hint: 'Penyakit dalam', controller: spesialisasi),
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
                      CustomTextField(hint: '0815********', controller: noTelp),
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
                          controller: alamat),
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
                          controller: tanggalLahir,
                          readOnly: true,
                          onTap: () async {
                            String date =
                                await _selectDate(context, tanggalLahir);
                            setState(() {
                              tanggalLahir.text = date;
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
                          hint: 'example@mail.com', controller: email),
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
                          value: statusLisensi.value,
                          items: status.map(
                            (e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            statusLisensi.value = value.toString();
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
                          controller: tanggalLisensi,
                          readOnly: true,
                          onTap: () async {
                            String date =
                                await _selectDate(context, tanggalLahir);
                            setState(() {
                              tanggalLisensi.text = date;
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
                          hint: 'PENS Hospital', controller: namaInstitusi),
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
                          controller: password,
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
                          npi: NPI.text,
                          namaDokter: namaDokter.text,
                          spesialisasi: spesialisasi.text,
                          jenisKelamin: jenisKelamin.value,
                          noTelp: noTelp.text,
                          alamat: alamat.text,
                          tanggalLahir: tanggalLahir.text,
                          email: email.text,
                          statusLisensi: statusLisensi.value,
                          tanggalLisensi: tanggalLisensi.text,
                          namaInstitusi: namaInstitusi.text,
                          password: password.text,
                        );
                        controller.createDokter(dokter.toJson());
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                'Kelola Dokter',
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
                      'Data Dokter',
                      style: bold20,
                    ),
                    ElevatedButton(
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
                        )),
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
                          label: Text('NPI',
                              style: bold10.copyWith(fontSize: 12))),
                      DataColumn(
                          label: Text('Nama',
                              style: bold10.copyWith(fontSize: 12))),
                      DataColumn(
                          label: Text('Kelamin',
                              style: bold10.copyWith(fontSize: 12))),
                      DataColumn(
                          label: Text('Alamat',
                              style: bold10.copyWith(fontSize: 12))),
                      DataColumn(
                          label: Text('Tgl lahir',
                              style: bold10.copyWith(fontSize: 12))),
                      DataColumn(
                          label: Text('Spesialisasi',
                              style: bold10.copyWith(fontSize: 12))),
                      DataColumn(
                          label: Text('Umur',
                              style: bold10.copyWith(fontSize: 12))),
                      DataColumn(
                          label: Text('No telp',
                              style: bold10.copyWith(fontSize: 12))),
                      DataColumn(
                          label: Text('Lisensi',
                              style: bold10.copyWith(fontSize: 12))),
                      DataColumn(
                          label: Text('action',
                              style: bold10.copyWith(fontSize: 12))),
                      // Add more columns as needed
                    ],
                    rows: controller.dokterData.value.map((dokter) {
                      return DataRow(
                        cells: [
                          DataCell(Text(dokter.npi)),
                          DataCell(Text(dokter.namaDokter)),
                          DataCell(Text(dokter.jenisKelamin)),
                          DataCell(Text(dokter.alamat)),
                          DataCell(Text(dokter.tanggalLahir)),
                          DataCell(Text(dokter.spesialisasi)),
                          DataCell(Text(
                              '${calculateAge('${dokter.tanggalLahir}')}')),
                          DataCell(Text(dokter.noTelp)),
                          DataCell(Text(dokter.statusLisensi)),
                          DataCell(Row(
                            children: [
                              ElevatedButton(
                                  onPressed: () {},
                                  child: const Icon(Icons.edit)),
                              const SizedBox(
                                width: 5,
                              ),
                              ElevatedButton(
                                  onPressed: () {},
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
        ),
      ],
    );
  }
}
