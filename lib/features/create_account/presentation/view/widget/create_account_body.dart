import 'dart:developer';

import 'package:enr_tickets/core/utils/strings.dart';
import 'package:enr_tickets/core/utils/widget/custom_button_register.dart';
import 'package:enr_tickets/core/utils/widget/custom_logo.dart';
import 'package:enr_tickets/core/utils/widget/sign_in_via.dart';
import 'package:enr_tickets/features/create_account/presentation/view/widget/custom_have_account_text_button.dart';
import 'package:enr_tickets/features/create_account/presentation/view/widget/form_feild_view_sign_in.dart';
import 'package:enr_tickets/features/create_account/presentation/view/widget/sign_in_methods_view.dart';
import 'package:enr_tickets/features/log_in/presentation/view/log_in.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CreateAccountBody extends StatefulWidget {
  const CreateAccountBody({super.key});

  @override
  State<CreateAccountBody> createState() => _CreateAccountBodyState();
}

class _CreateAccountBodyState extends State<CreateAccountBody> {
  final GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Gap(13),
            CustomLogo(),
            Text(
              create_new_account,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            FormFeildViewSignIn(
              nameController: nameController,
              emailController: emailController,
              phoneController: phoneController,
              passwordController: passwordController,
              confirmPasswordController: confirmPasswordController,
            ),
            Gap(10),
            VerifyButton(
              title: create_new_account,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  log("Account Created Successfully");
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LogIn()),
                    (route) => false,
                  );
                }
              },
            ),
            Gap(15),
            SignInVia(),
            Gap(15),
            SignInMethodsView(),
            Gap(15),
            CustomHaveAccountTextButton(
              title: arlreadyaccount,
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LogIn()),
                  (route) => false,
                );
                log("have account");
              },
            ),
          ],
        ),
      ),
    );
  }
}
