import 'package:enr_tickets/core/utils/colors.dart';
import 'package:enr_tickets/core/utils/widget/styles.dart';
import 'package:flutter/material.dart';

class CustomFornFeild extends StatelessWidget {
  final String hint;
  final IconData icon;

  const CustomFornFeild({super.key, required this.hint, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: buttonColor, width: 1.3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: buttonColor, width: 1.5),
          ),
          hint: Text(hint, style: Styles.hintStyle),
          prefixIcon: Icon(icon, color: iconColor),
        ),
      ),
    );
  }
}
