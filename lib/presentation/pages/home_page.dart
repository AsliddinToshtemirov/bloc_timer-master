import 'package:bloc_timer/presentation/widgets/action_buttons.dart';
import 'package:bloc_timer/presentation/widgets/text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Timer bloc"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 100),
            child: Center(child: TimerText()),
          ),
          Action_Buttons()
        ],
      ),
    );
  }
}
