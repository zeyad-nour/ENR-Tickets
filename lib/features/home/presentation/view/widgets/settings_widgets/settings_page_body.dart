// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:enr_tickets/core/utils/strings.dart';
import 'package:enr_tickets/core/widget/assets.dart';
import 'package:enr_tickets/core/widget/styles.dart';
import 'package:enr_tickets/features/home/presentation/state_mangement/settings_cubit/settings_cubit.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/settings_widgets/settings_card_widget.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/settings_widgets/switch_card_settings.dart';
import 'package:enr_tickets/features/home/presentation/view/widgets/settings_widgets/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            child: Image.asset(
              Theme.of(context).brightness == Brightness.dark
                  ? AssetsData
                        .logo // 👈 صورة للـ Dark Mode
                  : AssetsData.iconlogo, // 👈 صورة للـ Light Mode
            ),
          ),
        ),
        Text(settings, style: Styles.textStyle27),
        SettingsCardWidget(
          title: darkmode,
          task: context.watch<SettingsCubit>().themeText,
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (_) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: const Text("Follow System"),
                      onTap: () {
                        context.read<SettingsCubit>().changeTheme(
                          ThemeMode.system,
                        );
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: const Text("Light Mode"),
                      onTap: () {
                        context.read<SettingsCubit>().changeTheme(
                          ThemeMode.light,
                        );
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: const Text("Dark Mode"),
                      onTap: () {
                        context.read<SettingsCubit>().changeTheme(
                          ThemeMode.dark,
                        );
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
        SettingsCardWidget(task: languge, title: "English"),
        Gap(30),
        SwitchCardSettings(
          title: use_biometaic,
          onChanged: (p0) => print("object"),
        ),
        SwitchCardSettings(
          title: use_biometaic,
          onChanged: (p0) => print("object"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButtonWidget(
            onPressed: () => log("Change password"),
            task: changepassword,
            icon: Icons.lock_outline_rounded,
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButtonWidget(
            onPressed: () => log("Delete Account"),
            task: deleteaccount,

            icon: Icons.delete_outline_rounded,
          ),
        ),
      ],
    );
  }
}
