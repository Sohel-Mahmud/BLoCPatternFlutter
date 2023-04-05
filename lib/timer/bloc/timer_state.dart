/*
 * File: timer_state.dart
 * Project: bloc
 * File Created: Wednesday, 5th April 2023 3:03:18 pm
 * Author: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Last Modified: Wednesday, 5th April 2023 3:03:18 pm
 * Modified By: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Copyright 2021 - 2023 StaffAsia, StaffAsia
 */
import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {
  const TimerState(this.duration);

  final int duration;

  @override
  List<Object> get props => [duration];
}

class TimerInitial extends TimerState {
  const TimerInitial(super.duration);

  @override
  String toString() {
    return 'TimerInitial { duration: $duration }';
  }
}

class TimerRunPause extends TimerState {
  const TimerRunPause(super.duration);

  @override
  String toString() {
    return 'TimerRunPause { duration: $duration }';
  }
}

class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(super.duration);

  @override
  String toString() {
    return 'TimerRunInProgress { duration: $duration }';
  }
}

class TimerRunComplete extends TimerState {
  const TimerRunComplete(int duration) : super(0);

  @override
  String toString() {
    return 'TimerRunComplete';
  }
}
