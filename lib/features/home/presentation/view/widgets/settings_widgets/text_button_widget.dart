import 'package:enr_tickets/core/utils/colors.dart';
import 'package:enr_tickets/core/widget/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TextButtonWidget extends StatelessWidget {
  final IconData icon;
  final String task;
  final void Function()? onPressed;

  const TextButtonWidget({
    super.key,
    required this.task,
    this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Text(
            task,
            style: Styles.textStyle17.copyWith(
              color: Theme.of(
                context,
              ).textTheme.bodyLarge!.color, // 👈 نص ديناميكي
            ),
          ),
          const SizedBox(width: 20),
          Icon(
            icon,
            color: Theme.of(context).iconTheme.color, // 👈 أيقونة ديناميكية
            size: 30,
          ),
        ],
      ),
    );
  }
}
