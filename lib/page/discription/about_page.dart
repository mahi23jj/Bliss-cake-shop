import 'package:flutter/material.dart';





class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App with More Menu'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String choice) {
              _handleMenuSelection(context, choice);
            },
            itemBuilder: (BuildContext context) {
              return {'About', 'Settings', 'Help', 'Logout'}
                  .map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
            icon: Icon(Icons.more_vert), // Three dots icon
          ),
        ],
      ),
      body: Center(child: Text('Welcome to the home page!')),
    );
  }

  void _handleMenuSelection(BuildContext context, String choice) {
    switch (choice) {
      case 'About':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AboutPage()),
        );
        break;
      case 'Settings':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsPage()),
        );
        break;
      case 'Help':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HelpPage()),
        );
        break;
      case 'Logout':
        // Handle logout logic
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Logout'),
            content: Text('Are you sure you want to logout?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context), // Close dialog
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  // Add logout functionality here
                  Navigator.pop(context);
                },
                child: Text('Logout'),
              ),
            ],
          ),
        );
        break;
    }
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About')),
      body: Center(child: Text('This is the About page')),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(child: Text('This is the Settings page')),
    );
  }
}

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Help')),
      body: Center(child: Text('This is the Help page')),
    );
  }
}

