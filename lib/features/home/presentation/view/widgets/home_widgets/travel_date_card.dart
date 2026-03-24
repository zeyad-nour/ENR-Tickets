import 'package:enr_tickets/core/utils/colors.dart';
import 'package:enr_tickets/core/utils/strings.dart';
import 'package:enr_tickets/core/widget/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TravelDateCard extends StatelessWidget {
  final String title;
  final String date;
  final VoidCallback onTap;

  const TravelDateCard({
    super.key,
    required this.title,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          height: 80,
          decoration: BoxDecoration(
            color: theme.cardColor, // ✅ ديناميكي حسب Theme
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: theme.brightness == Brightness.dark
                    ? Colors.black45
                    : Colors.black12, // ✅ ظل مناسب لكل Theme
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Gap(10),
              Text(
                travelDate,
                style: Styles.textStyle17.copyWith(
                  color: theme.textTheme.bodyLarge!.color,
                ),
              ),

              const Gap(10),
              Icon(
                Icons.calendar_month_outlined,
                color: theme.iconTheme.color, // ✅ أيقونة ديناميكية
                size: 30,
              ),

              const Spacer(),
              Container(
                width: 2,
                height: 50,
                color: theme.dividerColor, // ✅ divider ديناميكي
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Styles.textStyle19.copyWith(
                      color: theme.textTheme.bodyLarge!.color,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    date,
                    style: Styles.textStyle19.copyWith(
                      color: theme.textTheme.bodyLarge!.color,
                    ),
                  ),
                ],
              ),

              const Gap(30),

              Icon(
                Icons.arrow_forward_ios,
                size: 25,
                color: theme.disabledColor, // ✅ السهم يتغير حسب Theme
              ),

              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
