import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawat_jalan/view/component/create_pendaftaran_form.dart';
import 'package:rawat_jalan/view/pages/admin/admin_home.dart';
import 'package:rawat_jalan/view/pages/admin/get/admin_controller.dart';
import 'package:rawat_jalan/view/pages/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<List<String?>?> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? role = prefs.getString('role');
    String? noTelp = prefs.getString('noTelp');
    if (role != null) {
      return [role, noTelp];
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    print('tessss');
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rawat Jalan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: checkLogin(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            if (snapshot.hasData) {
              var adminController = Get.put(AdminController());
              if (snapshot.data![0] == 'Admin') {
                adminController.getAdminDataById(snapshot.data![1]!);
                controller.role = 'Admin';
              } else {
                adminController.getDokterById(snapshot.data![1]!);
                controller.role = 'Dokter';
              }
              return AdminHomePage();
            } else {
              return const LoginPage();
            }
          }
        },
      ),
    );
  }
}
