// ignore_for_file: deprecated_member_use

import 'package:enr_tickets/core/utils/strings.dart';
import 'package:enr_tickets/core/widget/custom_button_register.dart';
import 'package:enr_tickets/features/home/presentation/view/home_view.dart';
import 'package:enr_tickets/features/log_in/presentation/state_mangement/log_in_cubit.dart';
import 'package:enr_tickets/core/widget/custom_logo.dart';
import 'package:enr_tickets/features/log_in/presentation/view/widgets/form_feild_view_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocConsumer<LogInCubit, LogInState>(
      listener: (context, state) {
        if (state is LogInSuccess) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => HomeView()),
            (route) => false,
          );
        } else if (state is LogInFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        final cubit = context.read<LogInCubit>();

        return SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomLogo(),
                Text(headlogIn),
                FormFeildViewLogin(
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                state is LogInLoding
                    ? CircularProgressIndicator()
                    : VerifyButton(
                        title: "LogIn",
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            cubit.logIn(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
