/*
 * File: user_bloc.dart
 * Project: personinfo
 * File Created: Tuesday, 4th April 2023 12:41:50 pm
 * Author: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Last Modified: Tuesday, 4th April 2023 12:41:50 pm
 * Modified By: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Copyright 2021 - 2023 StaffAsia, StaffAsia
 */

import 'package:blocpattern/basic_plus_api_call/bloc/personinfo/user_event.dart';
import 'package:blocpattern/basic_plus_api_call/bloc/personinfo/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/api_service.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  
  UserBloc(): super(UserInit()) {
    ApiService _apiService = ApiService();


    on<GetAllUserList>((event, emit) async {
      emit(UserLoading());
      try {
        final userList = await _apiService.getAllUserList();
        emit(UserDataLoaded(userList: userList));
      } catch (e) {
        emit(UserError(message: e.toString()));
      }
    });
  }
}
