import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawat_jalan/supabase.dart';
import 'package:rawat_jalan/view/pages/login_register/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



void main() async {
  await Supabase.initialize(
    url: URL,
    anonKey: anonKey,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    print('tessss');
    return GetMaterialApp(
      title: 'Rawat Jalan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}