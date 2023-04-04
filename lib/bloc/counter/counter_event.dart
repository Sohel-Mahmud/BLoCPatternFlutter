/*
 * File: counter_event.dart
 * Project: bloc
 * File Created: Monday, 3rd April 2023 10:49:47 am
 * Author: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Last Modified: Monday, 3rd April 2023 10:49:47 am
 * Modified By: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Copyright 2021 - 2023 StaffAsia, StaffAsia
 */
import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable{

}

class CounterIncrease extends CounterEvent{
  @override
  List<Object?> get props => [];
}

class CounterDecrease extends CounterEvent{
  @override
  List<Object?> get props => [];
}

class TitleToggle extends CounterEvent{
  @override
  List<Object?> get props => [];
}