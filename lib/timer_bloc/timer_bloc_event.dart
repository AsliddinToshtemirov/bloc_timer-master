part of 'timer_bloc_bloc.dart';

abstract class TimerBlocEvent extends Equatable {
  const TimerBlocEvent();

  @override
  List<Object> get props => [];
}

class TimerStarted extends TimerBlocEvent {
  const TimerStarted({required this.duration});
  final int duration;
}

class TimerResumed extends TimerBlocEvent {
  const TimerResumed();
}

class TimerPaused extends TimerBlocEvent {
  const TimerPaused();
}

class TimerReset extends TimerBlocEvent {
  const TimerReset();
}

class TimerTicked extends TimerBlocEvent {
  final int duration;
  const TimerTicked({required this.duration});

  @override
  List<Object> get props => [duration];
}
