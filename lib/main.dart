import 'package:flutter/material.dart';
import 'package:rawat_jalan/supabase.dart';
import 'package:rawat_jalan/view/login_page.dart';
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
    return MaterialApp(
      title: 'Rawat Jalan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}