import 'dart:developer';

import 'package:enr_tickets/core/utils/strings.dart';
import 'package:enr_tickets/core/utils/widget/custom_button_register.dart';
import 'package:enr_tickets/core/utils/widget/custom_form_feild.dart';
import 'package:enr_tickets/features/log_in/presentation/view/widgets/custom_forget_text.dart';
import 'package:flutter/material.dart';

class LogInBody extends StatelessWidget {
  const LogInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            headlogIn,
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          Text(
            subtitlelogIn,
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w700,
              color: Colors.black,
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
          VerifyButton(
            title: "title",
            onTap: () {
              log("Rigister Button");
            },
          ),
gap(height: 20),
          Center(child: Text(sign_in_with)),
        ],
      ),
    );
  }
}
