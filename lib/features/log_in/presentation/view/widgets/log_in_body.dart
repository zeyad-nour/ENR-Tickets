import 'dart:developer';

import 'package:enr_tickets/core/utils/strings.dart';
import 'package:enr_tickets/core/utils/widget/assets.dart';
import 'package:enr_tickets/core/utils/widget/custom_button_register.dart';
import 'package:enr_tickets/core/utils/widget/custom_forn_feild.dart';
import 'package:enr_tickets/features/log_in/presentation/view/widgets/custom_forget_text.dart';
import 'package:flutter/material.dart';

class LogInBody extends StatelessWidget {
  const LogInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Center(child: Image.asset(AssetsData.logo)),
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
          CustomFornFeild(hint: email, icon: Icons.email),
          CustomFornFeild(hint: password, icon: Icons.lock_outline),
          Container(
            margin: EdgeInsets.only(left: 10),
            alignment: Alignment.topLeft,
            width: double.infinity,
            height: 50,
            child: CustomForgetText(() {
              log("Forget Password ?");
            }),
          ),
          VerifyButton(title: "title", onTap: () {}),
        ],
      ),
    );
  }
}
