import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawat_jalan/view/pages/admin/admin_home.dart';
import 'package:rawat_jalan/view/pages/dokter/dokter_home.dart';
import 'package:rawat_jalan/view/style.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final SupabaseClient supabaseClient = Supabase.instance.client;

  TextEditingController phoneNumberController = TextEditingController();
   TextEditingController passwordController = TextEditingController();
  

  String phoneNumber = '';

  String password = '';

  String selectedRole = 'Admin';

  final roles = ['Admin', 'Dokter'];

  Future<void> _login() async {
     if (selectedRole == 'Admin') {
      final response = await supabaseClient
          .from('admin')
          .select()
          .eq('no_telp', phoneNumberController.text)
          .eq('password', passwordController.text);

          print('${passwordController.text}   ${phoneNumberController.text}');

      if (response.isNotEmpty) {
        print('Admin signed in successfully');
        Get.off(const AdminHomePage());
      } else {
        Get.snackbar(
          backgroundColor: Colors.red.withOpacity(0.5),
          "login invalid", 'nomor telfon atau password salah');
      }
    } else if (selectedRole == 'Admin'){
      final response = await supabaseClient
          .from('admin')
          .select()
          .eq('notelp', phoneNumber)
          .eq('password', password)
          ;

      if (response.isNotEmpty) {
        print('Admin signed in successfully');
        Get.off(const AdminHomePage());
      } else {
        Get.snackbar("login invalid", 'nomor telfon atau password salah');
      }
    }
    else {
      // handle other roles
      final response = await supabaseClient
          .from('admin')
          .select()
          .eq('no_telp', phoneNumber)
          .eq('password', password)
          ;

      if (response.isNotEmpty) {
        print('Admin signed in successfully');
        Get.off(const AdminHomePage());
      } else {
        Get.snackbar("login invalid", 'nomor telfon atau password salah');
      }
    }
      
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SizedBox(
      width: 600,
        
        child: Material(
      type: MaterialType.transparency,
      child: Container(
        width: 550,
        height: 650,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(blurRadius: 16, color: Colors.black.withOpacity(0.08))
        ], borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 75,
              ),
              Text(
                'Welcome Back',
                style: bold27.copyWith(color: const Color(0xff515151)),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Sign in to continue',
                style: regular14.copyWith(color: const Color(0xff838383)),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'No Telepon',
                    style: semibold16.copyWith(
                        color: const Color(0xff6C6C6C).withOpacity(0.8)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: phoneNumberController,
                    hint: '0815********',
                    onChanged: (p0) {
                      print(phoneNumberController.text);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Password',
                    style: semibold16.copyWith(
                        color: const Color(0xff6C6C6C).withOpacity(0.8)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    controller: passwordController,
                    hint: 'xxxxxxxxx',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  
                  Text(
                    'User Role',
                    style: semibold16.copyWith(
                        color: const Color(0xff6C6C6C).withOpacity(0.8)),
                  ),
                  DropdownButton2(
                    buttonStyleData: ButtonStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 2, color: const Color(0xffC9C9C9).withOpacity(0.7)),
                      )
                    ),
                    isExpanded: true,
                    value: selectedRole,
                    items: roles.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  },).toList(), onChanged:(value) {
                    setState(() {
                      selectedRole = value.toString();
                    });
                  },),
                 const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    onTap: () => _login(),
                    color: mainColor.withOpacity(0.66),
                    child: Text(
                      'Sign In',
                      style:
                          bold16.copyWith(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                 
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text('Don\'t have an account? ', style: bold10.copyWith(color: const Color(0xff727272)),),
                  //     TextButton(onPressed: () {
                  //       // loginOrRegister.changeValue();
                  //     }, child: Text('Sign up', style: bold10.copyWith(color: mainColor),))
                  //   ],
                  // )
                ],
              ),
            ],
          ),
        ),
      ),
    ))));
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.color, this.child = const SizedBox(), this.onTap}) ;

  final Color color;
  final Widget child;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(width: 1, color: const Color(0xffA7A7A7)),
              color: color),
          child: Center(child: child),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.hint, this.obscureText = false, this.onChanged, required this.controller}) ;

  final String hint;
  final bool obscureText;
  final Function(String)? onChanged;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) => onChanged,
      obscureText: obscureText,
      textAlignVertical: TextAlignVertical.center,
      style: semibold16.copyWith(
        color: const Color(0xff525252).withOpacity(0.9),
      ),
      decoration: InputDecoration(
        isDense: true,
        hintText: hint,
        contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 17),
        hintStyle: semibold16.copyWith(
            color: const Color(0xff525252).withOpacity(0.5),
            fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: const Color(0xffC9C9C9).withOpacity(0.7), width: 2)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: const Color(0xffC9C9C9).withOpacity(0.7), width: 2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: const Color(0xffC9C9C9).withOpacity(0.7), width: 2)),
      ),
    );
  }
}





