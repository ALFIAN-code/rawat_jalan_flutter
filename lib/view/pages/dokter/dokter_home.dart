import 'package:flutter/material.dart';

class DokterHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('dokter Dashboard'),
      ),
      body: const Center(
        child: Text('Welcome, dokter!'),
      ),
    );
  }
  }
