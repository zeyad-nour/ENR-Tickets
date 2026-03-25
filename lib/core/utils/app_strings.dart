import 'package:enr_tickets/features/home/presentation/state_mangement/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppStrings {
  static const Map<String, Map<String, String>> _localizedValues = {
    "en": {
      // Auth Screens
      "ENR": "ENR Tickets",
      "headLogIn": "Login to ENR Tickets",
      "createNewAccount": "Create Account",
      "fullNameUser": "Full name",
      "email": "Email",
      "phoneNumber": "Phone Number",
      "password": "Password",
      "confirmPassword": "Confirm password",
      "forgetPassword": "Forget Password ?",
      "alreadyAccount": "Do you already have an account?",
      "loginWord": "LogIn",
      "signInWith": "Or Sign in via",
      "google": "Google",
      "facebook": "Facebook",

      // Home Page
      "headHomePage": "Book Tickets",
      "travelDate": "Travel Date",
      "searchStation": "Search station...",
      "oneWay": "One Way",
      "roundTrip": "Round Trip",

      // Search Result Page
      "searchResultsTitle": "Search results",
      "availableTickets": "Available tickets",
      "trainNumber": "Train number",

      // Seatings / Settings
      "settings": "Settings",
      "followSystem": "Follow System",
      "language": "Language",
      "darkMode": "Dark Mode",
      "useBiometric": "Use biometric or short password",
      "changePassword": "Change password",
      "deleteAccount": "Delete Account",
      "departureStation": "Departure station",
      "arrivalStation": "Arrival station",

      // BottomNavigationBar
      "homePage": "Home",
      "bookingPage": "Bookings",
      "myTickets": "My Tickets",
      "settingsPage": "Settings",
    },

    "ar": {
      // Auth Screens
      "ENR": "تذاكر ENR",
      "headLogIn": "تسجيل الدخول إلى تذاكر ENR",
      "createNewAccount": "إنشاء حساب",
      "fullNameUser": "الاسم الكامل",
      "email": "البريد الإلكتروني",
      "phoneNumber": "رقم الهاتف",
      "password": "كلمة المرور",
      "confirmPassword": "تأكيد كلمة المرور",
      "forgetPassword": "نسيت كلمة المرور؟",
      "alreadyAccount": "هل لديك حساب بالفعل؟",
      "loginWord": "تسجيل الدخول",
      "signInWith": "أو تسجيل الدخول عبر",
      "google": "جوجل",
      "facebook": "فيسبوك",

      // Home Page
      "headHomePage": "حجز التذاكر",
      "travelDate": "تاريخ الرحلة",
      "searchStation": "ابحث عن محطة...",
      "oneWay": "رحلة ذهاب فقط",
      "roundTrip": "رحلة ذهاب وعودة",

      // Search Result Page
      "searchResultsTitle": "نتائج البحث",
      "availableTickets": "التذاكر المتاحة",
      "trainNumber": "رقم القطار",

      // Seatings / Settings
      "settings": "الإعدادات",
      "followSystem": "اتباع نظام الهاتف",
      "language": "اللغة",
      "darkMode": "الوضع الليلي",
      "useBiometric": "استخدام القياسات الحيوية أو كلمة مرور قصيرة",
      "changePassword": "تغيير كلمة المرور",
      "deleteAccount": "حذف الحساب",
      "departureStation": "محطة المغادرة",
      "arrivalStation": "محطة الوصول",

      // BottomNavigationBar
      "homePage": "الرئيسية",
      "bookingPage": "الحجوزات",
      "myTickets": "تذاكري",
      "settingsPage": "الإعدادات",
    },
  };

  // دالة ترجمة
  static String of(BuildContext context, String key) {
    final lang = context.read<SettingsCubit>().locale.languageCode;
    return _localizedValues[lang]![key] ?? key;
  }
}
