// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_app/main_screen.dart';
import 'package:my_app/screens/profile_sittings_screen.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:my_app/screens/home.dart';
import 'package:my_app/screens/login_screen.dart';
import 'package:my_app/screens/register_screen.dart';
import 'package:my_app/screens/walk_through_screen.dart';
import 'package:my_app/screens/my_profile_screen.dart';
import 'package:my_app/screens/my_collection_screen.dart';
import 'package:my_app/screens/collaborate_screen.dart';
import 'package:my_app/screens/404.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Retrieve walkthrough status from SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  final bool walkthroughCompleted = prefs.getBool('walkthroughCompleted') ?? false;

  runApp(
    ProviderScope( // Wrap in ProviderScope for Riverpod
      child: MyApp(walkthroughCompleted: walkthroughCompleted),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool walkthroughCompleted;
  const MyApp({super.key, required this.walkthroughCompleted});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      initialRoute: walkthroughCompleted ? '/login' : '/walkthrough',
      routes: {
        '/walkthrough': (context) => const Walkthrough(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const RegisterScreen(),
        '/': (context) => const MainScreen(),
        '/home': (context) => const HomeScreen(),
        '/myprofile': (context) => const MyProfile(),
        '/mycollection': (context) => const MyCollection(),
        '/collaborate': (context) => const CollaborateScreen(),
        '/profileSitting': (context) => const ProfileSittings(),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const NotFoundPage(),
      ),
    );
  }
}

/* 
in order to navigate between pages insed the mainscreen for appbar display and bottom nav
use this example cmd
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => MainScreen(index: 2)), //the index is the number of our page builder in the main_screen.dart
);

*/