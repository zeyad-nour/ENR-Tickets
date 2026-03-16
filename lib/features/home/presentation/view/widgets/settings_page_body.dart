// ignore_for_file: avoid_print

import 'package:enr_tickets/core/widget/assets.dart';
import 'package:enr_tickets/core/widget/styles.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/settings_card_widget.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/switch_card_settings.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SettingsPageBody extends StatelessWidget {
  const SettingsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(10),
        Center(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.6,

            child: Image.asset(AssetsData.iconlogo),
          ),
        ),
        Text("Settings", style: Styles.textStyle27),
        SettingsCardWidget(task: "Follow System", title: "Dark Mode"),
        SettingsCardWidget(task: "Languge", title: "English"),
        Gap(30),
        SwitchCardSettings(
          title: "Use biometric of short password",
          onChanged: (p0) => print("object"),
        ),
        SwitchCardSettings(
          title: "Use biometric of short password",
          onChanged: (p0) => print("object"),
        ),
        TextButtonWidget(task: "Change password"),
        TextButtonWidget(task: "Change password"),
        TextButtonWidget(task: "Change password"),
      ],
    );
  }
}
