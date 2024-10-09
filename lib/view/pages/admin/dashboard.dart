import 'package:flutter/material.dart';
import 'package:rawat_jalan/view/style.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Dashboard',
            style: bold31,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Row(
          children: [
            InfoPhil(
              // color: Colors.amber,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                Color.fromARGB(255, 134, 144, 255),
                Color.fromARGB(255, 179, 185, 248)
              ]),
            ),
            SizedBox(
              width: 20,
            ),
            InfoPhil(
              color: Colors.blueAccent,
            ),
            SizedBox(
              width: 20,
            ),
            InfoPhil(
              color: Colors.deepPurple,
            )
          ],
        )
      ],
    );
  }
}

class InfoPhil extends StatelessWidget {
  const InfoPhil({super.key, this.color, this.text, this.gradient});

  final Color? color;
  final String? text;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
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
                text ?? 'Total Pasien',
                style: regular14.copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '1000',
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
