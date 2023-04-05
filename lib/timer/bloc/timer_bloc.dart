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

    on<TimerStarted>(
      (event, emit) {

      }
    );
  }
}
