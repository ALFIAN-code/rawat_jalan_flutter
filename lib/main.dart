import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawat_jalan/supabase.dart';
import 'package:rawat_jalan/view/pages/admin/admin_home.dart';
import 'package:rawat_jalan/view/pages/dokter/dokter_home.dart';
import 'package:rawat_jalan/view/pages/login_register/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



void main() async {
  await Supabase.initialize(
    url: URL,
    anonKey: anonKey,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  Future<String?> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? role = prefs.getString('role');
    if (role != null) {
      return role;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    print('tessss');
    return GetMaterialApp(
      title: 'Rawat Jalan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(future: checkLogin(), builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (snapshot.hasData) {
            if (snapshot.data == 'Admin') {
              return const AdminHomePage();
            } else {
              return DokterHomePage();
            }
          } else {
            return const LoginPage();
          }
        }
      },),
    );
  }
}