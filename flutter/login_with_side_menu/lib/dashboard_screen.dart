import 'package:flutter/material.dart';
import 'package:navigation_poc/login_screen.dart';
import 'package:navigation_poc/side_menu.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = "./dashboard";

  void _logoutTapped(BuildContext context) {
    print("Logging out user");
    // Navigator.of(context).pop();
    Navigator.of(context).popAndPushNamed(LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      drawer: SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Hello Dashboard")),
          ElevatedButton(
              onPressed: () => _logoutTapped(context), child: Text("Logout")),
        ],
      ),
    );
  }
}
