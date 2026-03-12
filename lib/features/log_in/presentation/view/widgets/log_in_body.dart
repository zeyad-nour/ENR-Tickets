// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:enr_tickets/core/utils/strings.dart';
import 'package:enr_tickets/core/utils/widget/assets.dart';
import 'package:enr_tickets/core/utils/widget/custom_button_register.dart';
import 'package:enr_tickets/core/utils/widget/custom_form_feild.dart';
import 'package:enr_tickets/core/utils/widget/styles.dart';
import 'package:enr_tickets/features/create_account/presentation/view/create_account.dart';
import 'package:enr_tickets/features/log_in/presentation/view/widgets/custom_forget_text.dart';
import 'package:enr_tickets/core/utils/widget/custom_logo.dart';
import 'package:enr_tickets/features/log_in/presentation/view/widgets/sign_in_methods.dart';
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
            CustomFormFeild(
              hint: email,
              icon: Icons.email,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email is required";
                }
                if (!value.contains("@")) {
                  return "Enter valid email";
                }
                return null;
              },
            ),
            //password
            CustomFormFeild(
              hint: password,
              icon: Icons.lock_outline,
              controller: passwordController,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password is required";
                }
                if (value.length < 6) {
                  return "Password must be at least 6 characters";
                }
                return null;
              },
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              alignment: Alignment.topLeft,
              width: double.infinity,
              height: 50,
              child: Custom_Text_button(title: forgetpassword, () {
                //yet finished logic
                log("Forget Password ?");
              }),
            ),
            Gap(13),
            VerifyButton(
              title: "LogIn",
              onTap: () {
                if (formKey.currentState!.validate()) {
                  log("Valid Data");
                } else {
                  log("Invalid Data");
                }
                log("Rigister Button");
              },
            ),
            Gap(15),

            SignInVia(),

            Gap(15),

            Row(
              children: [
                SignMethods(
                  () {
                    log("Rigister google");
                  },
                  image: AssetsData.google,
                  methodName: google,
                ),
                SignMethods(
                  () {
                    log("Rigister facebook");
                  },
                  image: AssetsData.facebook,
                  methodName: facebook,
                ),
              ],
            ),
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
