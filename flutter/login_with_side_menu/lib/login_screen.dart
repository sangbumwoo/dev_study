import 'package:flutter/material.dart';
import 'package:navigation_poc/dashboard_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = './login';

  void _loginPressed(BuildContext context) {
    print("Login pressed");
    Navigator.pushReplacementNamed(context, DashboardScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(children: [
        Spacer(),
        Card(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Username')),
              TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Password')),
              ElevatedButton(
                  onPressed: () => _loginPressed(context), child: Text("Login"))
            ],
          ),
        ),
        Spacer()
      ]),
    );
  }
}
