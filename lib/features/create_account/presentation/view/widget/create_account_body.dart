import 'dart:developer';

import 'package:enr_tickets/core/utils/strings.dart';
import 'package:enr_tickets/core/utils/widget/custom_button_register.dart';
import 'package:enr_tickets/core/utils/widget/custom_form_feild.dart';
import 'package:enr_tickets/core/utils/widget/custom_logo.dart';
import 'package:enr_tickets/core/utils/widget/sign_in_via.dart';
import 'package:enr_tickets/features/create_account/presentation/view/widget/custom_have_account_text_button.dart';
import 'package:enr_tickets/features/create_account/presentation/view/widget/sign_in_methods_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CreateAccountBody extends StatelessWidget {
  const CreateAccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomLogo(),
          Text(
            create_new_account,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
          ),
          CustomFormFeild(hint: fullnameuser, icon: Icons.person),
          CustomFormFeild(hint: email, icon: Icons.email_rounded),
          CustomFormFeild(hint: phoneNumber, icon: Icons.person),
          CustomFormFeild(hint: password, icon: Icons.lock_outline_rounded),
          CustomFormFeild(
            hint: confirmpassword,
            icon: Icons.lock_outline_rounded,
          ),
          Gap(10),
          VerifyButton(title: create_new_account, onTap: () {}),
          Gap(15),
          SignInVia(),
          Gap(15),
          SignInMethodsView(),
          CustomHaveAccountTextButton(
            title: arlreadyaccount,
            onPressed: () {
              log("have account");
            },
          ),
        ],
      ),
    );
  }
}
