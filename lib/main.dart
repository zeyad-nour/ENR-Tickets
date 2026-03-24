import 'package:enr_tickets/features/create_account/presentation/view/create_account.dart';
import 'package:enr_tickets/features/home/presentation/state_mangement/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsCubit(),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final cubit = context.watch<SettingsCubit>();

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: cubit.themeMode,

            /// Light Theme
            theme: ThemeData(
              brightness: Brightness.light,
              fontFamily: "Quicksand",
              scaffoldBackgroundColor:
                  Colors.white, // 👈 لون الـ Scaffold في Light
              cardColor: Colors.white,
              primaryColor: Colors.blue,
              iconTheme: const IconThemeData(color: Colors.black),
              textTheme: const TextTheme(
                bodyLarge: TextStyle(color: Colors.black),
              ),
            ),

            /// Dark Theme
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              fontFamily: "Quicksand",
              scaffoldBackgroundColor: const Color(
                0xFF121212,
              ), // 👈 لون الـ Scaffold في Dark
              cardColor: const Color(0xFF1E1E1E),
              primaryColor: Colors.blue,
              iconTheme: const IconThemeData(color: Colors.white),
              textTheme: const TextTheme(
                bodyLarge: TextStyle(color: Colors.white),
              ),
            ),

            home: const CreateAccount(),
          );
        },
      ),
    );
  }
}
