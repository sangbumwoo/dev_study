import 'dart:async';

import 'package:flutter/material.dart';
import 'package:life_cycle/rabit.dart';

class StatefulSampleWidget extends StatefulWidget {
  int value;
  String title;
  Rabit rabit;
  StatefulSampleWidget({super.key, required this.value, required this.title, required this.rabit});

  @override
  State<StatefulSampleWidget> createState() => _StatefulSampleWidgetState();
}

class _StatefulSampleWidgetState extends State<StatefulSampleWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Timer.periodic(Duration(seconds: 2), (timer) {
    //   print(timer.tick);
    //   int index = timer.tick % 4;

    //   setState(() {
    //     switch (index) {
    //       case 0:
    //         widget.rabit.updateState(RabitState.SLEEP);
    //         break;
    //       case 1:
    //         widget.rabit.updateState(RabitState.EAT);
    //         break;
    //       case 2:
    //         widget.rabit.updateState(RabitState.RUN);
    //         break;
    //       case 3:
    //         widget.rabit.updateState(RabitState.WALK);
    //         break;
    //       default:
    //     }
    //   });

    //   print(widget.rabit.state);
    // });
  }

  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  //   setState() {}
  // }

  @override
  void didUpdateWidget(covariant StatefulSampleWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget ${widget.value.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    print('build !!');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(widget.rabit.state.toString()),
      ),
    );
  }
}
