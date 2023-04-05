/*
 * File: counter_state.dart
 * Project: bloc
 * File Created: Monday, 3rd April 2023 10:50:02 am
 * Author: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Last Modified: Monday, 3rd April 2023 10:50:02 am
 * Modified By: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Copyright 2021 - 2023 StaffAsia, StaffAsia
 */
import 'package:equatable/equatable.dart';

abstract class CounterState extends Equatable {}

class CounterInit extends CounterState {
  @override
  List<Object?> get props => [];
}

class CounterUpdate extends CounterState {
  final int counter;

  CounterUpdate({required this.counter});

  @override
  List<Object?> get props => [counter];
}

class TitleUpdate extends CounterState {
  final String title;

  TitleUpdate({required this.title});
  
  @override
  List<Object?> get props => [title];
}
