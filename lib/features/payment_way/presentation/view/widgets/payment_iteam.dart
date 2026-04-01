// ignore_for_file: deprecated_member_use

import 'package:enr_tickets/features/payment_way/presentation/state_mangement/cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget paymentItem(BuildContext context, String title, String imagePath) {
  final cubit = context.read<PaymentCubit>();
  final selected = context.watch<PaymentCubit>().selectedMethod;

  bool isSelected = selected == title;

  return Expanded(
    child: GestureDetector(
      onTap: () => cubit.selectMethod(title),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),

        child: Column(
          children: [
            Radio<String>(
              value: title,
              groupValue: selected,
              onChanged: (v) => cubit.selectMethod(v!),
            ),
            Expanded(child: Image.asset(imagePath)),
          ],
        ),
      ),
    ),
  );
}
