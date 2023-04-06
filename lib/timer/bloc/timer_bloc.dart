/*
 * File: timer_bloc.dart
 * Project: bloc
 * File Created: Wednesday, 5th April 2023 3:02:57 pm
 * Author: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Last Modified: Wednesday, 5th April 2023 3:02:58 pm
 * Modified By: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Copyright 2021 - 2023 StaffAsia, StaffAsia
 */
import 'dart:async';

import 'package:blocpattern/timer/bloc/timer_event.dart';
import 'package:blocpattern/timer/bloc/timer_state.dart';
import 'package:blocpattern/timer/ticker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;

  static const int _duration = 60;

  StreamSubscription<int>? _tickerSubscription;

  TimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const TimerInitial(_duration)) {
          
    on<TimerStarted>((event, emit) {
      emit(TimerRunInProgress(event.duration));
      _tickerSubscription?.cancel();
      _tickerSubscription =
          _ticker.tick(ticks: event.duration).listen((duration) {
        add(TimerTicked(duration: duration));
      });
    });

    on<TimerTicked>((event, emit) {
      emit(event.duration > 0
          ? TimerRunInProgress(event.duration)
          : const TimerRunComplete());
    });

    on<TimerPaused>((event, emit) {
      if (state is TimerRunInProgress) {
        _tickerSubscription?.pause();
        emit(TimerRunPause(state.duration));
      }
    });

    on<TimerResumed>((event, emit) {
      if (state is TimerRunPause) {
        _tickerSubscription?.resume();
        emit(TimerRunInProgress(state.duration));
      }
    });

    on<TimerReset>((event, emit) {
      _tickerSubscription?.cancel();
      emit(const TimerInitial(_duration));
    });
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }
}
