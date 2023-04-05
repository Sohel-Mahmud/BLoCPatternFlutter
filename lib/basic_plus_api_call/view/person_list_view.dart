/*
 * File: person_list_view.dart
 * Project: view
 * File Created: Monday, 3rd April 2023 4:11:21 pm
 * Author: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Last Modified: Monday, 3rd April 2023 4:11:21 pm
 * Modified By: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Copyright 2021 - 2023 StaffAsia, StaffAsia
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/personinfo/user_bloc.dart';
import '../bloc/personinfo/user_event.dart';
import '../bloc/personinfo/user_state.dart';

class PersonListView extends StatelessWidget {
  const PersonListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) => UserBloc()..add(GetAllUserList()),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Person List'),
          ),
          body: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserInit) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is UserLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is UserDataLoaded) {
                return ListView.builder(
                  itemCount: state.userList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.userList[index].name.toString()),
                      subtitle: Text(state.userList[index].email.toString()),
                    );
                  },
                );
              } else if (state is UserError) {
                return Center(
                  child: Text(state.message),
                );
              } else {
                return const Center(
                  child: Text('Unknown State'),
                );
              }
            },
          )),
    );
  }
}
