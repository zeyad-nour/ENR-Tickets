import 'package:enr_tickets/core/widget/styles.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String task;
  final void Function()? onPressed;
  const TextButtonWidget({super.key, required this.task, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Text(task, style: Styles.textStyle17),
          Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey),
        ],
      ),
    );
  }
}
