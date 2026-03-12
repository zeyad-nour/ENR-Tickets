// ignore_for_file: camel_case_types

import 'package:enr_tickets/core/utils/colors.dart';
import 'package:enr_tickets/core/utils/strings.dart';
import 'package:enr_tickets/core/utils/widget/styles.dart';
import 'package:flutter/material.dart';

class Custom_Text_button extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const Custom_Text_button(this.onPressed, {super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: title == forgetpassword
            ? Styles.textStyle19
            : Styles.textStyle19.copyWith(color: hintColorForm),
      ),
    );
  }
}
