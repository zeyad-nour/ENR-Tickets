// ignore_for_file: deprecated_member_use

import 'package:enr_tickets/core/widget/assets.dart';
import 'package:flutter/material.dart';

class CustomHomeLogo extends StatelessWidget {
  const CustomHomeLogo({super.key});

  @override
  Widget build(BuildContext context) {
    // اختار الصورة حسب الـ Theme الحالي
    final String logo = Theme.of(context).brightness == Brightness.dark
        ? AssetsData
              .logo // صورة Dark Mode
        : AssetsData.iconlogo; // صورة Light Mode

    return Container(
      color: Colors.white.withOpacity(0.2), // ممكن تخليها دايناميك بعدين
      child: Center(
        child: Image.asset(logo, width: 250, height: 250, fit: BoxFit.cover),
      ),
    );
  }
}
