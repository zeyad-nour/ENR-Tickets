import 'package:enr_tickets/core/widget/assets.dart';
import 'package:enr_tickets/core/widget/custom_button_register.dart';
import 'package:enr_tickets/core/widget/styles.dart';
import 'package:enr_tickets/features/log_in/presentation/view/log_in.dart';
import 'package:enr_tickets/features/verify_otp/presentation/state_mangement/cubit/cubit_verify_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class VerifyBody extends StatelessWidget {
  final String email;

  const VerifyBody({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitVerifyCubit, CubitVerifyState>(
      listener: (context, state) {
        /// Verify Success
        if (state is CubitVerifySucsess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Code verified successfully")),
          );

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const LogIn()),
            (route) => false,
          );
        }

        /// Verify Failure
        if (state is CubitVerifyFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }

        /// Resend Success
        if (state is CubitVerifyResend) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("OTP sent again")));
        }
      },

      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsData.iconlogo),

            const Gap(20),

            Text("Verification Code", style: Styles.textStyle27),

            const Gap(10),

            Text(
              "Enter the 6-digit code sent to your email",
              style: Styles.hintStyle,
              textAlign: TextAlign.center,
            ),

            const Gap(30),

            TextField(
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter OTP",
              ),
              onChanged: (value) {
                if (value.length == 6) {
                  context.read<CubitVerifyCubit>().verifyOtp(value, email);
                }
              },
            ),

            const Gap(26),

            if (state is CubitVerifyLoding)
              const CircularProgressIndicator()
            else
              VerifyButton(
                title: "Resend code",
                onTap: () {
                  context.read<CubitVerifyCubit>().resendOtp(email);
                },
              ),
          ],
        );
      },
    );
  }
}
