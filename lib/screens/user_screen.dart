import 'package:flutter/material.dart';
import 'package:my_app/models/user_model.dart';
import 'package:my_app/services/auth_service.dart';
import 'package:my_app/widgets/custom_bottom_nav.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  User? _user;
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final authService = AuthService();
      final user = await authService.fetchUser();
      setState(() {
        _user = user;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
              ? Center(child: Text('Error: $_error'))
              : _user == null
                  ? const Center(child: Text('No user data found'))
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(_user!.profilePicture),
                            radius: 50,
                          ),
                          const SizedBox(height: 16),
                          Text('ID: ${_user!.id}'),
                          Text('Name: ${_user!.name}'),
                          Text('Email: ${_user!.email}'),
                        ],
                      ),
                    ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: 0,
        onItemTapped: (index) {},
      ),
    );
  }
}
