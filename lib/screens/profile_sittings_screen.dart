import 'package:flutter/material.dart';

class ProfileSittings extends StatelessWidget {
  const ProfileSittings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Make Payment'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Select Payment Option', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _buildOptionItem(context, 'themes', Icons.card_giftcard, content: _buildThemesContent()),
        _buildOptionItem(context, 'password', Icons.lock, content: _buildPasswordResetForm()),
        _buildOptionItem(context, 'personal information', Icons.account_balance_wallet, onTap: () {
          Navigator.pushNamed(context, '/personalInformation');
        }),
        _buildOptionItem(context, 'notifications', Icons.notifications),
        _buildOptionItem(context, 'privacy', Icons.privacy_tip, onTap: () {
          Navigator.pushNamed(context, '/privacy');
        }),
        const SizedBox(height: 20), 
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            minimumSize: const Size(double.infinity, 50), 
          ),
          child: const Text('Logout', style: TextStyle(color: Colors.white)),
        ),
      ],
    ),
  ),
  ),
);
  }

  Widget _buildOptionItem(BuildContext context, String title, IconData iconData, {VoidCallback? onTap, Widget? content}) {
    return ExpansionTile(
      title: Row(
        children: [
          Icon(iconData, color: Colors.grey),
          const SizedBox(width: 16),
          Text(title, style: const TextStyle(fontSize: 16)),
        ],
      ),
      trailing: const Icon(Icons.arrow_drop_down, color: Colors.grey),
      onExpansionChanged: (expanded) {
        if (!expanded && onTap != null) {
          onTap();
        }
      },
      children: [content ?? Container()],
    );
  }

  Widget _buildPasswordResetForm() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(labelText: 'New Password'),
            obscureText: true,
          ),
          const SizedBox(height: 8),
          const TextField(
            decoration: InputDecoration(labelText: 'Confirm New Password'),
            obscureText: true,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  Widget _buildThemesContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: false, 
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}