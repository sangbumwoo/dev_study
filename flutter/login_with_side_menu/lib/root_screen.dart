import 'package:flutter/material.dart';
import 'package:navigation_poc/dashboard_screen.dart';
import 'package:navigation_poc/login_screen.dart';
import 'package:navigation_poc/side_menu.dart';

class RootScreen extends StatefulWidget {
  static const routeName = '/';

  // RootScreen({Key key}) : super(key: key);

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  late Future _userSessionFuture;

  @override
  void initState() {
    _userSessionFuture = this._getUserSessionStatus();
    super.initState();
  }

  Future<bool> _getUserSessionStatus() async {
    return false;
  }

  Widget _loadingScreen() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime,
      // appBar: AppBar(
      //   title: Text('Navigation POC'),
      // ),
      drawer: SideMenu(),
      body: FutureBuilder(
        future: _userSessionFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            bool _userLoginStatus = snapshot.data;
            return _userLoginStatus ? DashboardScreen() : LoginScreen();
          } else {
            return _loadingScreen();
          }
        },
      ),
    );
  }
}
