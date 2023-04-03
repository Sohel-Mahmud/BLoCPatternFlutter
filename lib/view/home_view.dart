/*
 * File: home_view.dart
 * Project: view
 * File Created: Monday, 3rd April 2023 3:20:55 pm
 * Author: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Last Modified: Monday, 3rd April 2023 3:20:55 pm
 * Modified By: Sohel Mahmud (sohel@staffasia.org)
 * -----
 * Copyright 2021 - 2023 StaffAsia, StaffAsia
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';
import '../bloc/counter_state.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BLoC'),
        ),
        body: BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TitleWidget(state: state),
                CounterWidget(state: state),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(CounterIncrease());
                      },
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(CounterDecrease());
                      },
                      tooltip: 'Decrement',
                      child: const Icon(Icons.minimize),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterBloc>().add(TitleToggle());
                    },
                    child: Text("Toggle Title")),
                const Spacer(),

              ],
            ),
          );
        })
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class CounterWidget extends StatelessWidget {
  final CounterState state;
  const CounterWidget({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("counter build");
    return Text(
      (state is CounterInit) ? '0' : '${context.read<CounterBloc>().counter}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class TitleWidget extends StatelessWidget {
  final CounterState state;

  const TitleWidget({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("title build");
    return Text(
      (state is CounterInit)
          ? 'You have pushed the button this many times:'
          : context.read<CounterBloc>().title,
    );
  }
}