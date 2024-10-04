// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rawat_jalan/view/pages/admin/admin_home.dart';
// import 'package:rawat_jalan/view/pages/dokter/dokter_home.dart';
// import 'package:rawat_jalan/view/style.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// class LoginCard extends StatefulWidget {
//   const LoginCard({super.key});

//   @override
//   State<LoginCard> createState() => _LoginCardState();
// }

// class _LoginCardState extends State<LoginCard> {

//   final SupabaseClient supabaseClient = Supabase.instance.client;
//   String phoneNumber = '';
//   String password = '';
//   String selectedRole = 'Admin';

//   final roles = ['Admin', 'Dokter'];

//   Future<void> _login() async {
//     if (selectedRole == 'Admin') {
//       final adminResponse = await supabaseClient
//           .from('admin')
//           .select()
//           .eq('notelp', phoneNumber)
//           .eq('password', password)
//           .select();
//       if (adminResponse.isNotEmpty) {
//         print('admin berhasil sign in');
//         Get.off(AdminHomePage());
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Invalid phone number or password')),
//         );
//       }
//     } else if (selectedRole == 'Dokter') {
//       final dokterResponse = await supabaseClient
//           .from('dokter')
//           .select()
//           .eq('notelp', phoneNumber)
//           .eq('password', password)
//           .select();
//       if (dokterResponse.isNotEmpty) {
//         print('admin berhasil sign in');
//        Get.off(DokterHomePage());
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Invalid phone number or password')),
//         );
//       }
//     }else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Invalid phone number or password')),
//         );
//       }
//     }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       type: MaterialType.transparency,
//       child: Container(
//         width: 550,
//         height: 650,
//         decoration: BoxDecoration(boxShadow: [
//           BoxShadow(blurRadius: 16, color: Colors.black.withOpacity(0.08))
//         ], borderRadius: BorderRadius.circular(20), color: Colors.white),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 50),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const SizedBox(
//                 height: 75,
//               ),
//               Text(
//                 'Welcome Back',
//                 style: bold27.copyWith(color: const Color(0xff515151)),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 'Sign in to continue',
//                 style: regular14.copyWith(color: const Color(0xff838383)),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'No Telepon',
//                     style: semibold16.copyWith(
//                         color: const Color(0xff6C6C6C).withOpacity(0.8)),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const CustomTextField(
//                     hint: '0815********',
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   Text(
//                     'Password',
//                     style: semibold16.copyWith(
//                         color: const Color(0xff6C6C6C).withOpacity(0.8)),
//                   ),
//                   const SizedBox(
//                     height: 15,
//                   ),
//                   const CustomTextField(
//                     hint: 'xxxxxxxxx',
//                     obscureText: true,
//                   ),
//                   const SizedBox(
//                     height: 40,
//                   ),
                  
//                   Text(
//                     'User Role',
//                     style: semibold16.copyWith(
//                         color: const Color(0xff6C6C6C).withOpacity(0.8)),
//                   ),
//                   DropdownButton2(
//                     buttonStyleData: ButtonStyleData(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(width: 2, color: const Color(0xffC9C9C9).withOpacity(0.7)),
//                       )
//                     ),
//                     isExpanded: true,
//                     value: selectedRole,
//                     items: roles.map((e) {
//                     return DropdownMenuItem(
//                       value: e,
//                       child: Text(e),
//                     );
//                   },).toList(), onChanged:(value) {
//                     setState(() {
//                       selectedRole = value.toString();
//                     });
//                   },),
//                  const SizedBox(
//                     height: 30,
//                   ),
//                   CustomButton(
//                     onTap: () => _login(),
//                     color: mainColor.withOpacity(0.66),
//                     child: Text(
//                       'Sign In',
//                       style:
//                           bold16.copyWith(color: Colors.black.withOpacity(0.6)),
//                     ),
//                   ),
                 
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.center,
//                   //   children: [
//                   //     Text('Don\'t have an account? ', style: bold10.copyWith(color: const Color(0xff727272)),),
//                   //     TextButton(onPressed: () {
//                   //       // loginOrRegister.changeValue();
//                   //     }, child: Text('Sign up', style: bold10.copyWith(color: mainColor),))
//                   //   ],
//                   // )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
