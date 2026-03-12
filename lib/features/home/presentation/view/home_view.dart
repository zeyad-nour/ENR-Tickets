import 'package:enr_tickets/core/utils/colors.dart';
import 'package:enr_tickets/core/utils/strings.dart';
import 'package:enr_tickets/features/home/presentation/view/pages/booking_page.dart';
import 'package:enr_tickets/features/home/presentation/view/pages/home_page.dart';
import 'package:enr_tickets/features/home/presentation/view/pages/my_tickets_page.dart';
import 'package:enr_tickets/features/home/presentation/view/pages/settings_page.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  // 4 pages
  final List<Widget> _pages = const [
    HomePage(),
    BookingPage(),
    MyTicketsPage(),
    SettingsPage(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        iconSize: 30,
        elevation: 20,
        selectedFontSize: 17,
        showSelectedLabels: true,

        selectedLabelStyle: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
        currentIndex: _currentIndex,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: iconColor,
        unselectedItemColor: Colors.grey[600],
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: settingspage,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmarks_outlined),
            label: bookingpage,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: mytickets,
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: homepage),
        ],
      ),
    );
  }
}
