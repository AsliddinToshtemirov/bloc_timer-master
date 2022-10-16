import 'package:bloc_timer/timer_bloc/timer_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Action_Buttons extends StatelessWidget {
  const Action_Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBlocBloc, TimerBlocState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (state is TimerInitial) ...[
              FloatingActionButton(
                child: const Icon(Icons.play_arrow),
                onPressed: () => context
                    .read<TimerBlocBloc>()
                    .add(TimerStarted(duration: state.duration)),
              ),
            ],
            if (state is TimerRunInProgress) ...[
              FloatingActionButton(
                child: const Icon(Icons.pause),
                onPressed: () =>
                    context.read<TimerBlocBloc>().add(const TimerPaused()),
              ),
              FloatingActionButton(
                child: const Icon(Icons.replay),
                onPressed: () =>
                    context.read<TimerBlocBloc>().add(const TimerReset()),
              ),
            ],
            if (state is TimerRunPause) ...[
              FloatingActionButton(
                child: const Icon(Icons.play_arrow),
                onPressed: () =>
                    context.read<TimerBlocBloc>().add(const TimerResumed()),
              ),
              FloatingActionButton(
                child: const Icon(Icons.replay),
                onPressed: () =>
                    context.read<TimerBlocBloc>().add(const TimerReset()),
              ),
            ],
            if (state is TimerRunComplete) ...[
              FloatingActionButton(
                child: const Icon(Icons.replay),
                onPressed: () =>
                    context.read<TimerBlocBloc>().add(const TimerReset()),
              ),
            ]
          ],
        );
      },
    );
  }
}
