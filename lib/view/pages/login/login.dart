import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawat_jalan/view/pages/admin/admin_home.dart';
import 'package:rawat_jalan/view/pages/admin/get/admin_controller.dart';
import 'package:rawat_jalan/view/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var obscure = true.obs;

  // String password = '';
  String selectedRole = 'Admin';

  final roles = ['Admin', 'Dokter'];

  void storeLoginData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('role', selectedRole);
    prefs.setString('noTelp', phoneNumberController.text);
  }

  Future<void> _login() async {
    if (selectedRole == 'Admin') {
      var adminController = Get.put(AdminController());
      await adminController.getAdminDataById(phoneNumberController.text).then(
        (value) {
          if (adminController.adminAuth(
              phoneNumberController.text, passwordController.text)) {
            storeLoginData();
            Get.off(() => AdminHomePage());
          } else {
            Get.snackbar(
                backgroundColor: Colors.red.withOpacity(0.5),
                "login invalid",
                'nomor telfon atau password salah');
          }
        },
      );
    } else if (selectedRole == 'Dokter') {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SizedBox(
                width: 600,
                child: Material(
                  type: MaterialType.transparency,
                  child: Container(
                    width: 550,
                    height: 650,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 16,
                              color: Colors.black.withOpacity(0.08))
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
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
                            style:
                                bold27.copyWith(color: const Color(0xff515151)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Sign in to continue',
                            style: regular14.copyWith(
                                color: const Color(0xff838383)),
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
                                    color: const Color(0xff6C6C6C)
                                        .withOpacity(0.8)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CustomTextField(
                                controller: phoneNumberController,
                                obscureText: false,
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
                                    color: const Color(0xff6C6C6C)
                                        .withOpacity(0.8)),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Obx(
                                () => CustomTextField(
                                  controller: passwordController,
                                  hint: 'xxxxxxxxx',
                                  obscureText: obscure.value,
                                  suffix: IconButton(
                                      onPressed: () {
                                        obscure.value = !obscure.value;
                                      },
                                      icon: Icon(obscure.value
                                          ? Icons.visibility
                                          : Icons.visibility_off)),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                'User Role',
                                style: semibold16.copyWith(
                                    color: const Color(0xff6C6C6C)
                                        .withOpacity(0.8)),
                              ),
                              DropdownButton2(
                                buttonStyleData: ButtonStyleData(
                                    decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 2,
                                      color: const Color(0xffC9C9C9)
                                          .withOpacity(0.7)),
                                )),
                                isExpanded: true,
                                value: selectedRole,
                                items: roles.map(
                                  (e) {
                                    return DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    );
                                  },
                                ).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedRole = value.toString();
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomButton(
                                onTap: () => _login(),
                                color: mainColor.withOpacity(0.66),
                                child: Text(
                                  'Sign In',
                                  style: bold16.copyWith(
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ),
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
      {super.key,
      required this.color,
      this.child = const SizedBox(),
      this.onTap});

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
      {super.key,
      required this.hint,
      this.obscureText = false,
      this.onChanged,
      required this.controller,
      this.suffix});

  final String hint;
  final bool obscureText;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final Widget? suffix;

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
        suffixIcon: suffix,
        isDense: true,
        hintText: hint,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 30, vertical: 17),
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
