import 'dart:async';

import 'package:bloc_timer/data/ticker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'timer_bloc_event.dart';
part 'timer_bloc_state.dart';

class TimerBlocBloc extends Bloc<TimerBlocEvent, TimerBlocState> {
  final Tick _ticker;
  static const int _duration = 30;
  StreamSubscription<int>? _streamSubscription;

  TimerBlocBloc({required Tick ticker})
      : _ticker = ticker,
        super(const TimerInitial(_duration)) {
    on<TimerStarted>((TimerStarted event, Emitter<TimerBlocState> emit) {
      emit(TimerRunInProgress(event.duration));
      _streamSubscription?.cancel();
      _streamSubscription = _ticker
          .tick(ticks: event.duration)
          .listen((duration) => add(TimerTicked(duration: duration)));
    });
    on<TimerPaused>((TimerPaused event, Emitter<TimerBlocState> emit) {
      if (state is TimerRunInProgress) {
        _streamSubscription?.pause();
        emit(TimerRunPause(state.duration));
      }
    });
    on<TimerResumed>((TimerResumed event, Emitter<TimerBlocState> emit) {
      if (state is TimerRunPause) {
        _streamSubscription?.resume();
        emit(TimerRunInProgress(state.duration));
      }
    });
    on<TimerReset>((TimerReset event, Emitter<TimerBlocState> emit) {
      _streamSubscription?.cancel();
      emit(const TimerInitial(_duration));
    });
    on<TimerTicked>((TimerTicked event, Emitter<TimerBlocState> emit) {
      emit(event.duration > 0
          ? TimerRunInProgress(event.duration)
          : const TimerRunComplete());
    });
  }
}
