import 'package:flutter/material.dart';
import 'package:flutter_sqflite_study_sample/src/home.dart';
import 'package:flutter_sqflite_study_sample/src/repository/sql_database.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SqlDataBase.instance;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
