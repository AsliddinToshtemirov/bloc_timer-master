import 'package:bloc_timer/data/ticker.dart';
import 'package:bloc_timer/presentation/pages/home_page.dart';
import 'package:bloc_timer/timer_bloc/timer_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => TimerBlocBloc(ticker: const Tick()),
        child: const HomePage(),
      ),
    );
  }
}
