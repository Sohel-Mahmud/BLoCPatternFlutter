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
import 'package:blocpattern/bloc/personinfo/user_event.dart';
import 'package:blocpattern/bloc/personinfo/user_state.dart';
import 'package:blocpattern/service/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  
  UserBloc(super.initialState) {
    ApiService _apiService = ApiService();


    on<GetAllUserList>((event, emit) async {
      emit(UserLoading());
      try {
        final userList = await ApiService().getAllUserList();
        emit(UserDataLoaded(userList: userList));
      } catch (e) {
        emit(UserError(message: e.toString()));
      }
    });
  }
}
