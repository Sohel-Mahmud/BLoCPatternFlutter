/*
 * File: user_event.dart
 * Project: personinfo
 * File Created: Tuesday, 4th April 2023 12:41:57 pm
 * Author: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Last Modified: Tuesday, 4th April 2023 12:41:57 pm
 * Modified By: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Copyright 2021 - 2023 StaffAsia, StaffAsia
 */
import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable{}

class GetAllUserList extends UserEvent{
  @override
  List<Object?> get props => [];
}