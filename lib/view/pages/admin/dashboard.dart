import 'package:flutter/material.dart';
import 'package:rawat_jalan/view/style.dart';

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

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: deviceWidth*0.5,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InfoPhil(
                      gradient: LinearGradient(
                          colors: [Color(0xffFFA8A8), Color(0xffFF8E8E)]),
                      count: '10',
                      title: 'Pasien Hari Ini',
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    InfoPhil(
                      gradient: LinearGradient(
                          colors: [ Color(0xffA8FFD9),  Color(0xff8EFFC1)]),
                      count: '10',
                      title: 'Pasien Bulan Ini',
                    ),
                  ],
                )
              ],
            )),
          Container()
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
