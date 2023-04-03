/*
 * File: counter_bloc.dart
 * Project: bloc
 * File Created: Monday, 3rd April 2023 10:49:55 am
 * Author: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Last Modified: Monday, 3rd April 2023 10:49:55 am
 * Modified By: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Copyright 2021 - 2023 StaffAsia, StaffAsia
 */
import 'package:blocpattern/bloc/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  String title = '';

  CounterBloc() : super(CounterInit()) {
    on<CounterIncrease>((event, emit) {
      counter++;
      emit(CounterUpdate(counter: counter));
    });

    on<CounterDecrease>((event, emit) {
      counter--;
      emit(CounterUpdate(counter: counter));
    });

    on<TitleToggle>((event, emit) {
      title = "New Title";
      emit(TitleUpdate(title: title));
    });
  }
}
