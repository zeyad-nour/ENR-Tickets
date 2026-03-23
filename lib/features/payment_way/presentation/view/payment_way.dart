import 'package:enr_tickets/core/utils/colors.dart';
import 'package:enr_tickets/core/widget/styles.dart';
import 'package:enr_tickets/features/payment_way/presentation/view/widgets/custom_divider.dart';
import 'package:enr_tickets/features/payment_way/presentation/view/widgets/custom_text.dart';
import 'package:enr_tickets/features/payment_way/presentation/view/widgets/custom_widget_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PaymentWay extends StatelessWidget {
  const PaymentWay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Complete Payment",
          style: Styles.textStyle20.copyWith(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: appbarColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Gap(20),
          CustomText(
            title: "Complete Payment",
            stylestitle: Styles.textStyle27,
          ),
          Gap(20),
          CustomDivider(),
          Gap(20),
          CustomText(
            title: "350 EGP Amount Due:",
            stylestitle: Styles.textStyle20,
          ),
          Gap(20),
          CustomDivider(),
          CustomText(
            title: "Choose Payment Method :",
            stylestitle: Styles.textStyle20,
          ),
          Gap(20),
          CustomWidgetCard(title: "Bank Cards"),
        ],
      ),
    );
  }
}
