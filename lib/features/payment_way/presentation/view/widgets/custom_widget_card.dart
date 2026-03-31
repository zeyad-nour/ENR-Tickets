import 'package:enr_tickets/features/payment_way/presentation/view/widgets/payment_iteam.dart';
import 'package:flutter/material.dart';

class CustomWidgetCard extends StatelessWidget {
  final String title;
  final List<Map<String,String>> methods; // title & image

  const CustomWidgetCard({super.key, required this.title, required this.methods});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Row(
          children: methods.map((method) {
            return paymentItem(context, method['title']!, method['image']!);
          }).toList(),
        ),
      ],
    );
  }
}