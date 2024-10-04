import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 200,
            color: Colors.blue,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Home"),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Pasien"),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Dokter"),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Pendaftaran"),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Logout"),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              child: Text("hi admin....."),
            ),
          )
        ],
      ),
    );
  }
}