import 'dart:async';

import 'package:flutter/material.dart';
import 'package:life_cycle/sateful_sample_widget.dart';
import 'package:life_cycle/stateless_sample_widget.dart';
import 'rabit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int value = 0;
  @override
  void initState() {
    value = 0;
    super.initState();
    Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        value++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: StatelessSampleWidget(
      //   title: "구멍이 없는 박스로 실험하는 자",
      //   rabit: Rabit(name: '개남토끼1', state: RabitState.SLEEP),
      // ),
      home: StatefulSampleWidget(
        title: "구멍이 있는 박스로 실험하는 자",
        value: value,
        rabit: Rabit(name: '개남토끼1', state: RabitState.SLEEP),
      ),
    );
  }
}
