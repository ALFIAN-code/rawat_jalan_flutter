import 'package:flutter/material.dart';
import 'package:rawat_jalan/view/style.dart';

class NavbarButton extends StatelessWidget {
  const NavbarButton({super.key, required this.text, required this.icon, required this.selected, this.onTap});
  final String text;
  final Widget icon;
  final bool selected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: (selected == true)? mainColor:Colors.transparent,
        ),
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
        
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(child: icon),
            const SizedBox(width: 25,),
            Text(text, style:regular14,),
          ],
        ),
      ),
    );
  }
}