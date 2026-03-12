import 'dart:developer';

import 'package:enr_tickets/core/utils/strings.dart';
import 'package:enr_tickets/core/utils/validators.dart';
import 'package:enr_tickets/core/utils/widget/custom_button_register.dart';
import 'package:enr_tickets/core/utils/widget/custom_form_feild.dart';
import 'package:enr_tickets/core/utils/widget/custom_logo.dart';
import 'package:enr_tickets/core/utils/widget/sign_in_via.dart';
import 'package:enr_tickets/features/create_account/presentation/view/widget/custom_have_account_text_button.dart';
import 'package:enr_tickets/features/create_account/presentation/view/widget/sign_in_methods_view.dart';
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
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            CustomLogo(),
            Text(
              create_new_account,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
            CustomFormFeild(
              hint: fullnameuser,
              icon: Icons.person,
              controller: nameController,
              validator: Validators.nameValidator,
            ),
            CustomFormFeild(
              hint: email,
              icon: Icons.email_rounded,
              controller: emailController,
              validator: Validators.emailValidator,
            ),
            CustomFormFeild(
              hint: phoneNumber,
              icon: Icons.person,
              controller: phoneController,
              keyboardType: TextInputType.phone,
              validator: Validators.phoneValidator,
            ),
            CustomFormFeild(
              hint: password,
              icon: Icons.lock_outline,
              controller: passwordController,
              obscureText: true,
              validator: Validators.passwordValidator,
            ),
            CustomFormFeild(
              hint: confirmpassword,
              icon: Icons.lock_outline,
              controller: confirmPasswordController,
              obscureText: true,
              validator: (value) {
                if (value != passwordController.text) {
                  return "Passwords do not match";
                }
                return null;
              },
            ),
            Gap(10),
            VerifyButton(
              title: create_new_account,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  log("Account Created Successfully");
                }
              },
            ),
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
      ),
    );
  }
}
