/*
 * File: timer_event.dart
 * Project: bloc
 * File Created: Wednesday, 5th April 2023 3:03:07 pm
 * Author: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Last Modified: Wednesday, 5th April 2023 3:03:07 pm
 * Modified By: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Copyright 2021 - 2023 StaffAsia, StaffAsia
 */
abstract class TimerEvent {
  const TimerEvent();
}

class TimerStarted extends TimerEvent {
  final int duration;

  const TimerStarted({required this.duration});
}

class TimerPaused extends TimerEvent {
  const TimerPaused();
}

class TimerResumed extends TimerEvent {
  const TimerResumed();
}

class TimerReset extends TimerEvent {
  const TimerReset();
}

class _TimerTicked extends TimerEvent {

  final int duration;
  const _TimerTicked({required this.duration});

}
