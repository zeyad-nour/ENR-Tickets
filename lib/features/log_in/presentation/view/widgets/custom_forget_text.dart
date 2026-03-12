import 'package:enr_tickets/core/utils/strings.dart';
import 'package:enr_tickets/core/utils/widget/styles.dart';
import 'package:flutter/material.dart';

class CustomForgetText extends StatelessWidget {
  final void Function()? onPressed;
  const CustomForgetText(this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(forgetpassword, style: Styles.textStyle19),
    );
  }
}
