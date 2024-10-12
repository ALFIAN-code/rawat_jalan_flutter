import 'package:flutter/material.dart';

class PasienHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('pasien Dashboard'),
      ),
      body: const Center(
        child: Text('Welcome, paosien!'),
      ),
    );
  }
}
