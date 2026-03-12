// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:enr_tickets/core/utils/strings.dart';
import 'package:enr_tickets/core/utils/widget/custom_button_register.dart';
import 'package:enr_tickets/core/utils/widget/custom_form_feild.dart';
import 'package:enr_tickets/core/utils/widget/styles.dart';
import 'package:enr_tickets/features/log_in/presentation/view/widgets/custom_forget_text.dart';
import 'package:enr_tickets/features/log_in/presentation/view/widgets/custom_logo.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LogInBody extends StatelessWidget {
  const LogInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomLogo(),
          Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.8)),
            child: Text(
              headlogIn,
              style: Styles.textStyle27.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 33,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.88)),
            child: Text(
              subtitlelogIn,
              style: Styles.textStyle19.copyWith(color: Colors.black),
            ),
          ),
          CustomFormFeild(hint: email, icon: Icons.email),
          CustomFormFeild(hint: password, icon: Icons.lock_outline),
          Container(
            margin: EdgeInsets.only(left: 10),
            alignment: Alignment.topLeft,
            width: double.infinity,
            height: 50,
            child: CustomForgetText(() {
              log("Forget Password ?");
            }),
          ),
          Gap(13),
          VerifyButton(
            title: "LogIn",
            onTap: () {
              log("Rigister Button");
            },
          ),
          Gap(15),
          Center(
            child: Text(
              sign_in_with,
              style: Styles.hintStyle.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.grey[350],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
