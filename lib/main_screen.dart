import 'package:flutter/material.dart';
import 'package:my_app/screens/404.dart';
import 'package:my_app/screens/following_screen.dart';
import 'package:my_app/screens/my_collection_screen.dart';
import 'package:my_app/screens/my_profile_screen.dart';
import 'package:my_app/widgets/custom_app_bar.dart';
import 'screens/home_screen.dart';
import './screens/collaborate_screen.dart';
import './widgets/custom_bottom_nav.dart';

class MainScreen extends StatefulWidget {
  final int index;

  const MainScreen({super.key, this.index = 0});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectedIndex;

  final List<Widget> _pages = [
    const HomeScreen(),
    const Following(),
    const CollaborateScreen(),
    const MyProfile(),
    const NotFoundPage(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: _pages[_selectedIndex],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
