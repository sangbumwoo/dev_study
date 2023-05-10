import 'dart:async';

import 'package:flutter/material.dart';
import 'package:life_cycle/rabit.dart';

class StatelessSampleWidget extends StatelessWidget {
  String title;
  Rabit rabit;
  StatelessSampleWidget({super.key, required this.title, required this.rabit}) {
    Timer.periodic(Duration(seconds: 2), (timer) {
      print(timer.tick);
      int index = timer.tick % 4;
      switch (index) {
        case 0:
          rabit.updateState(RabitState.SLEEP);
          break;
        case 1:
          rabit.updateState(RabitState.EAT);
          break;
        case 2:
          rabit.updateState(RabitState.RUN);
          break;
        case 3:
          rabit.updateState(RabitState.WALK);
          break;
        default:
      }
      print(rabit.state);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(rabit.state.toString()),
      ),
    );
  }
}
