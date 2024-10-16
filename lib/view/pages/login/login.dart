import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rawat_jalan/view/component/custom_button.dart';
import 'package:rawat_jalan/view/component/custom_textfield.dart';
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
    var adminController = Get.put(AdminController());
    if (selectedRole == 'Admin') {
      await adminController.getAdminDataById(phoneNumberController.text).then(
        (value) {
          if (adminController.adminAuth(
              phoneNumberController.text, passwordController.text)) {
            storeLoginData();
            adminController.role = 'Admin';
            Get.off(() => AdminHomePage());
          } else {
            Get.snackbar(
                backgroundColor: Colors.red.withOpacity(0.5),
                "login invalid",
                'nomor telfon atau password salah');
          }
        },
      );
    } else if (selectedRole == 'Dokter') {
      await adminController.getDokterById(phoneNumberController.text).then(
        (value) {
          if (adminController.dokterAuth(
              phoneNumberController.text, passwordController.text)) {
            storeLoginData();
            adminController.role = 'Dokter';
            Get.off(() => AdminHomePage());
          } else {
            Get.snackbar(
                backgroundColor: Colors.red.withOpacity(0.5),
                "login invalid",
                'nomor telfon atau password salah');
          }
        },
      );
    }
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
                                    print('role: $selectedRole');
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
