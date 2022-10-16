part of 'timer_bloc_bloc.dart';

abstract class TimerBlocState extends Equatable {
  const TimerBlocState(this.duration);
  final int duration;
  @override
  List<Object> get props => [duration];
}

class TimerInitial extends TimerBlocState {
  const TimerInitial(super.duration);

  @override
  String toString() => 'TimerInitial { duration: $duration  }';
}

class TimerRunPause extends TimerBlocState {
  const TimerRunPause(super.duration);

  @override
  String toString() => 'TimerRunPause { duration: $duration }';
}

class TimerRunInProgress extends TimerBlocState {
  const TimerRunInProgress(super.duration);

  @override
  String toString() => 'TimerRunInProgress { duration: $duration }';
}

class TimerRunComplete extends TimerBlocState {
  const TimerRunComplete() : super(0);
}
