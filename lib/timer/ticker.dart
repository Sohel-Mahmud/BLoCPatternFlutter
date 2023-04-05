/*
 * File: ticker.dart
 * Project: timer
 * File Created: Wednesday, 5th April 2023 3:02:48 pm
 * Author: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Last Modified: Wednesday, 5th April 2023 3:02:48 pm
 * Modified By: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Copyright 2021 - 2023 StaffAsia, StaffAsia
 */
class Ticker{
  const Ticker();
  Stream<int> tick({required int ticks}){
    return Stream.periodic(const Duration(seconds: 1), (x) => ticks - x - 1)
    .take(ticks);
  }
}