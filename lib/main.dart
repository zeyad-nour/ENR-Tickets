import 'package:enr_tickets/core/utils/local_storage.dart';
import 'package:enr_tickets/features/create_account/presentation/view/create_account.dart';
import 'package:enr_tickets/features/settings/presentation/state_mangement/settings_cubit/settings_cubit.dart';
import 'package:enr_tickets/features/home/presentation/view/pages/home_page.dart';
import 'package:enr_tickets/features/seat_selection/presentation/state_mangement/cubit/seat_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool loggedIn = await LocalStorage.isUserLoggedIn();
  runApp(MyApp(loggedIn: loggedIn));
}

class MyApp extends StatelessWidget {
  final bool loggedIn; // Store login state

  const MyApp({super.key, required this.loggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsCubit>(create: (_) => SettingsCubit()),
        BlocProvider<SeatSelectionCubit>(create: (_) => SeatSelectionCubit()),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final cubit = context.watch<SettingsCubit>();

          return MaterialApp(
            debugShowCheckedModeBanner: false,

            /// Language
            locale: cubit.locale,
            supportedLocales: const [Locale('en'), Locale('ar')],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            /// Theme
            themeMode: cubit.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
              fontFamily: "Quicksand",
              scaffoldBackgroundColor: Colors.white,
              cardColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.black),
              textTheme: const TextTheme(
                bodyLarge: TextStyle(color: Colors.black),
              ),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              fontFamily: "Quicksand",
              scaffoldBackgroundColor: Colors.black,
              cardColor: const Color(0xFF1E1E1E),
              iconTheme: const IconThemeData(color: Colors.white),
              textTheme: const TextTheme(
                bodyLarge: TextStyle(color: Colors.white),
              ),
            ),

            home: loggedIn ? const HomePage() : const CreateAccount(),
          );
        },
      ),
    );
  }
}
