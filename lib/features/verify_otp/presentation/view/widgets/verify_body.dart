import 'package:enr_tickets/core/widget/assets.dart';
import 'package:enr_tickets/core/widget/styles.dart';
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
        // ✅ Success
        if (state is CubitVerifySucsess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Code verified successfully")),
          );

          // 🔥 تقدر تعمل Navigation هنا
          // Navigator.pushReplacementNamed(context, '/home');
        }

        // ❌ Failure
        if (state is CubitVerifyFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
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

            /// 🔥 OTP Input (هنا بيتم الverify مباشرة)
            TextField(
              keyboardType: TextInputType.number,
              maxLength: 6,
              onChanged: (value) {
                print("Typing: $value");

                if (value.length == 6) {
                  print("OTP Entered: $value");
                  context.read<CubitVerifyCubit>().verifyOtp(value,email);
                }
              },
            ),

            const Gap(36),

            /// ⏳ Loading فقط
            if (state is CubitVerifyLoding) const CircularProgressIndicator(),
          ],
        );
      },
    );
  }
}
