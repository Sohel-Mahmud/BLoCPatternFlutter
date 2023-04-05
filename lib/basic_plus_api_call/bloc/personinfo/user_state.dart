/*
 * File: user_state.dart
 * Project: personinfo
 * File Created: Tuesday, 4th April 2023 12:42:05 pm
 * Author: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Last Modified: Tuesday, 4th April 2023 12:42:06 pm
 * Modified By: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Copyright 2021 - 2023 StaffAsia, StaffAsia
 */
import 'package:equatable/equatable.dart';

import '../../model/user_model.dart';

abstract class UserState extends Equatable {}

class UserInit extends UserState {
  @override
  List<Object?> get props => [];
}

class UserLoading extends UserState {
  @override
  List<Object?> get props => [];
}

class UserDataLoaded extends UserState {
  
  final List<UserModel> userList;

  UserDataLoaded({required this.userList});
  
  @override
  List<Object?> get props => [userList];
}

class UserError extends UserState {
  final String message;

  UserError({required this.message});

  @override
  List<Object?> get props => [message];
}