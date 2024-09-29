import 'package:flutter/material.dart';
import 'package:rawat_jalan/supabase.dart';
import 'package:rawat_jalan/view/admin/admin_home.dart';
import 'package:rawat_jalan/view/dokter/dokter_home.dart';
import 'package:rawat_jalan/view/pasien/pasien_home.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final SupabaseClient supabaseClient = Supabase.instance.client;
  String phoneNumber = '';
  String password = '';
  String selectedRole = 'Admin';

  Future<void> _login() async {
    if (selectedRole == 'Admin') {
      final AdminResponse = await supabaseClient
          .from('admin')
          .select()
          .eq('notelp', phoneNumber)
          .eq('password', password)
          .select();

      if (AdminResponse.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminHomePage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid phone number or password')),
        );
      }
    } else if (selectedRole == 'Dokter') {
      final DokterResponse = await supabaseClient
          .from('dokter')
          .select()
          .eq('notelp', phoneNumber)
          .eq('password', password)
          .select();
      if (DokterResponse.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DokterHomePage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid phone number or password')),
        );
      }
    } else if (selectedRole == 'Pasien') {
      final PasienResponse = await supabaseClient
          .from('pasien')
          .select()
          .eq('notelp', phoneNumber)
          .eq('password', password)
          .select();
      if (PasienResponse.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PasienHomePage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid phone number or password')),
        );
      }
    }

    // if (response.isNotEmpty) {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                phoneNumber = value;
              });
            },
            decoration: InputDecoration(labelText: 'Phone Number'),
          ),
          TextField(
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          DropdownButton(
            hint: const Text("Pilih Role"),
            value: selectedRole,
            
            onChanged: (String? newValue) {
              setState(() {
                selectedRole = newValue ?? 'null';
              });
            },
            items: const [
              DropdownMenuItem(
                value: 'Admin',
                child: Text('Admin'),
              ),
              DropdownMenuItem(
                value: 'Dokter',
                child: Text('Dokter'),
              ),
              DropdownMenuItem(
                value: 'Pasien',
                child: Text('Pasien'),
              ),
            ],
            // ['Admin', 'Dokter', 'Pasien']
            //     .map((String value) {
            //   return DropdownMenuItem(
            //     value: value,
            //     child: Text(value),
            //   );
            // }).toList(),
          ),
          ElevatedButton(
            onPressed: _login,
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
