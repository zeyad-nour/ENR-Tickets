// ignore_for_file: deprecated_member_use

import 'dart:developer';
import 'package:enr_tickets/core/utils/strings.dart';
import 'package:enr_tickets/core/utils/widget/custom_button_register.dart';
import 'package:enr_tickets/core/utils/widget/styles.dart';
import 'package:enr_tickets/features/create_account/presentation/view/create_account.dart';
import 'package:enr_tickets/features/log_in/presentation/view/widgets/custom_forget_text.dart';
import 'package:enr_tickets/core/utils/widget/custom_logo.dart';
import 'package:enr_tickets/features/log_in/presentation/view/widgets/form_feild_view_login.dart';
import 'package:enr_tickets/core/utils/widget/sign_in_via.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LogInBody extends StatefulWidget {
  const LogInBody({super.key});

  @override
  State<LogInBody> createState() => _LogInBodyState();
}

class _LogInBodyState extends State<LogInBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
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
            //email
            FormFeildViewLogin(
              emailController: emailController,
              passwordController: passwordController,
            ),
            Custom_Text_button(title: forgetpassword, () {
              //yet finished logic
              log("Forget Password ?");
            }),
            Gap(13),
            VerifyButton(
              title: "LogIn",
              onTap: () {
                if (formKey.currentState!.validate()) {
                  log("Valid Data");
                  // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>), (route)=>false);
                } else {
                  log("Invalid Data");
                }
              },
            ),
            Gap(15),
            SignInVia(),
            Gap(15),
            Custom_Text_button(() {
              log("Dont have account");
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => CreateAccount()));
            }, title: "Dont have an account ? Signup"),
          ],
        ),
      ),
    );
  }
}
