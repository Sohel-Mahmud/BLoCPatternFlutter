/*
 * File: api_service.dart
 * Project: service
 * File Created: Tuesday, 4th April 2023 12:43:14 pm
 * Author: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Last Modified: Tuesday, 4th April 2023 12:43:14 pm
 * Modified By: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Copyright 2021 - 2023 StaffAsia, StaffAsia
 */
import 'package:dio/dio.dart';

import '../model/user_model.dart';

class ApiService {
  Future<List<UserModel>> getAllUserList() async {
    List<UserModel> userList = [];
    final Dio _dio = Dio();

    try {
      Response response =
          await _dio.get('https://jsonplaceholder.typicode.com/users');

      if (response.statusCode == 200) {
        response.data.forEach((user) {
          userList.add(UserModel.fromJson(user));
        });
        return userList;
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }
}
