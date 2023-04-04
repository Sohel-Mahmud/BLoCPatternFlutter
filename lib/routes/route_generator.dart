/*
 * File: route_generator.dart
 * Project: routes
 * File Created: Monday, 3rd April 2023 1:58:25 pm
 * Author: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Last Modified: Monday, 3rd April 2023 1:58:25 pm
 * Modified By: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Copyright 2021 - 2023 StaffAsia, StaffAsia
 */
import 'package:blocpattern/routes/routes.dart';
import 'package:flutter/material.dart';

import '../view/home_view.dart';
import '../view/person_list_view.dart';

class RouterCustom {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch(settings.name){
      case Routes.home:
        return MaterialPageRoute(
            builder: (_) => const MyHomePage(),
            settings: const RouteSettings(name: Routes.home));
      case Routes.apitestview:
        return MaterialPageRoute(
            builder: (_) => const PersonListView(),
            settings: const RouteSettings(name: Routes.apitestview));
      
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ),
            settings: const RouteSettings(name: "404"));
    }
  }
}
