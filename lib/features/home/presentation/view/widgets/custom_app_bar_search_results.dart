import 'package:enr_tickets/core/utils/colors.dart';
import 'package:enr_tickets/core/utils/strings.dart';
import 'package:enr_tickets/core/utils/widget/styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomAppBarSearchResults extends StatelessWidget {
  const CustomAppBarSearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 32,
            color: secoundryIconColorSearchPage,
          ),
        ),
        Gap(MediaQuery.sizeOf(context).width * 0.16),
        Column(
          children: [
            Gap(20),
            Text(SearchResultsTitle, style: Styles.textStyle27),
            Subtitlewidget(),
          ],
        ),
      ],
    );
  }
}

class Subtitlewidget extends StatelessWidget {
  const Subtitlewidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Sohag",
          style: Styles.hintStyle.copyWith(color: Colors.grey[800]),
        ),
        Gap(10),
        Icon(Icons.arrow_forward, size: 20),
        Gap(10),
        Text(
          "8/2/206",
          style: Styles.hintStyle.copyWith(color: Colors.grey[800]),
        ),
      ],
    );
  }
}
