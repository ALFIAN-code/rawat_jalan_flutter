import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawat_jalan/model/dokter_model.dart';
import 'package:rawat_jalan/model/jadwal_model.dart';
import 'package:rawat_jalan/model/pasien_model.dart';
import 'package:rawat_jalan/view/style.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OverviewPage extends StatelessWidget {
  OverviewPage({super.key});
  List<String> hari = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
    'Minggu'
  ];

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

  String getHari(String tanggalString) {
    DateTime tanggal = DateTime.parse(tanggalString);
    List<String> hari = [
      'Senin',
      'Selasa',
      'Rabu',
      'Kamis',
      'Jumat',
      'Sabtu',
      'Minggu'
    ];
    return hari[tanggal.weekday - 1];
  }

  Future<List<Jadwal>> getJadwalByHari(String hari) {
    int hariIndex = [
      'Senin',
      'Selasa',
      'Rabu',
      'Kamis',
      'Jumat',
      'Sabtu',
      'Minggu'
    ].indexOf(hari);
    DateTime tanggalAwal = DateTime.now()
        .subtract(Duration(days: DateTime.now().weekday - hariIndex));
    DateTime tanggalAkhir = tanggalAwal.add(Duration(days: 7));

    try {
      return _supabase
        .from('jadwal')
        .select('* , ruangan(nama_ruangan)')
        .filter('tanggal', 'gte', tanggalAwal.toString())
        .filter('tanggal', 'lte', tanggalAkhir.toString())

        .then((data) {
      List<Jadwal> jadwalList = data.map((e) => Jadwal.fromJson(e)).toList();
      List<Jadwal> jadwalHari = jadwalList.where((jadwal) {
        return [
              'Senin',
              'Selasa',
              'Rabu',
              'Kamis',
              'Jumat',
              'Sabtu',
              'Minggu'
            ][DateTime.parse(jadwal.tanggal.toString()).weekday - 1] ==
            hari;
      }).toList();
      return jadwalHari;
    });
    } catch (e) {
      rethrow;
    }
  }

  final _supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: deviceWidth * 0.6,
            child: Column(
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FutureBuilder(
                      future: _supabase.from('pasien').select(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return InfoPhil(
                            // color: Colors.amber,
                            title: 'Jumlah Pasien',
                            count: snapshot.data!.length.toString(),
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromARGB(255, 134, 144, 255),
                                  Color.fromARGB(255, 179, 185, 248)
                                ]),
                          );
                        } else {
                          return const InfoPhil(
                            // color: Colors.amber,
                            title: 'Jumlah Pasien',
                            count: '0',
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color.fromARGB(255, 134, 144, 255),
                                  Color.fromARGB(255, 179, 185, 248)
                                ]),
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    FutureBuilder(
                      future: _supabase.from('dokter').select(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return InfoPhil(
                            title: 'Jumlah Dokter',
                            count: snapshot.data!.length.toString(),
                            gradient: const LinearGradient(colors: [
                              Color.fromARGB(255, 238, 151, 255),
                              Color.fromARGB(255, 245, 197, 255)
                            ]),
                          );
                        } else {
                          return const InfoPhil(
                            title: 'Jumlah Dokter',
                            count: '0',
                            gradient: LinearGradient(colors: [
                              Color.fromARGB(255, 238, 151, 255),
                              Color.fromARGB(255, 245, 197, 255)
                            ]),
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    FutureBuilder(
                      future: _supabase.from('pendaftaran').select(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return InfoPhil(
                            title: 'Rawat Jalan',
                            count: snapshot.data!.length.toString(),
                            gradient: const LinearGradient(colors: [
                              Color.fromARGB(255, 110, 213, 81),
                              Color.fromARGB(255, 174, 254, 151),
                            ]),
                          );
                        } else {
                          return const InfoPhil(
                            title: 'Rawat Jalan',
                            count: '0',
                            gradient: LinearGradient(colors: [
                              Color.fromARGB(255, 110, 213, 81),
                              Color.fromARGB(255, 174, 254, 151),
                            ]),
                          );
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
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
                      FutureBuilder(
                        future: _supabase.from('pasien').select(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            
                            List<PasienModel> data = snapshot.data!
                                .map(
                                  (e) => PasienModel.fromJson(e),
                                )
                                .toList();
                            return DataTable(
                              columns: const [
                                DataColumn(label: Text('Nama Lengkap')),
                                DataColumn(label: Text('Nama Panggilan')),
                                DataColumn(label: Text('Jenis Kelamin')),
                                DataColumn(label: Text('Alamat')),
                                DataColumn(label: Text('Tanggal Lahir')),
                                DataColumn(label: Text('Agama')),
                                DataColumn(label: Text('Umur')),
                                DataColumn(label: Text('No telp'))
                                // Add more columns as needed
                              ],
                              rows: data.map((pasien) {
                                return DataRow(
                                  cells: [
                                    DataCell(Text(pasien.namaLengkap)),
                                    DataCell(Text(pasien.namaPanggilan)),
                                    DataCell(Text(pasien.jenisKelamin)),
                                    DataCell(Text(pasien.alamat)),
                                    DataCell(Text(pasien.tanggalLahir)),
                                    DataCell(Text(pasien.agama)),
                                    DataCell(Text(
                                        '${calculateAge(pasien.tanggalLahir)}')),
                                    DataCell(Text(pasien.noTelp)),
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
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
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
                      FutureBuilder(
                        future: _supabase.from('dokter').select(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<Dokter> data = snapshot.data!
                                .map(
                                  (e) => Dokter.fromJson(e),
                                )
                                .toList();
                            return DataTable(
                              columns: const [
                                DataColumn(label: Text('NPI')),
                                DataColumn(label: Text('Nama Dokter')),
                                DataColumn(label: Text('Kelamin')),
                                DataColumn(label: Text('Alamat')),
                                DataColumn(label: Text('Tgl lahir')),
                                DataColumn(label: Text('Spesialisasi')),
                                DataColumn(label: Text('Umur')),
                                DataColumn(label: Text('No telp'))
                                // Add more columns as needed
                              ],
                              rows: data.map((dokter) {
                                return DataRow(
                                  cells: [
                                    DataCell(Text(dokter.npi)),
                                    DataCell(Text(dokter.namaDokter)),
                                    DataCell(Text(dokter.jenisKelamin)),
                                    DataCell(Text(dokter.alamat)),
                                    DataCell(Text(dokter.tanggalLahir)),
                                    DataCell(Text(dokter.spesialisasi)),
                                    DataCell(Text(
                                        '${calculateAge(dokter.tanggalLahir)}')),
                                    DataCell(Text(dokter.noTelp)),
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
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 1000,
              margin: const EdgeInsets.fromLTRB(0, 105, 30, 0),
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
                    'Jadwal',
                    style: bold20,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: hari.map(
                      (value) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              value,
                              style: regular14,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            FutureBuilder(
                              future: getJadwalByHari(value),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  var data = snapshot.data;
                                  return DataTable(
                                    columns: const [
                                      DataColumn(label: Text('tanggal')),
                                      DataColumn(label: Text('waktu selesai')),
                                      // Add more columns as needed
                                    ],
                                    rows: data != null ? data.map((value) {
                                      return DataRow(
                                        cells: [
                                          DataCell(
                                              Text(value.tanggal)),
                                          DataCell(Text(value.waktuSelesai)),

                                          // Add more cells as needed
                                        ],
                                      );
                                    }).toList() : [
                                      const DataRow(cells: [
                                        DataCell(Text('Kosong')),
                                        DataCell(Text('Kosong')),
                                      ])
                                    ],
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        );
                      },
                    ).toList(),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
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
