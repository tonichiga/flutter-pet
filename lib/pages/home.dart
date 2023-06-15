import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/counter_bloc/counter_block.dart';
import 'package:my_app/bloc/user_bloc/user_bloc.dart';
import 'package:my_app/bloc/user_bloc/user_events.dart';
import 'package:my_app/bloc/user_bloc/user_state.dart';
import 'package:my_app/components/charts/candles.dart';
import 'package:my_app/utils/colors.dart';
import "package:my_app/entity/charts/chart_bar.dart";

class Home extends StatefulWidget {
  final chartData;

  const Home({Key? key, required this.chartData}) : super(key: key);

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  List<String> _chartData = [];
  @override
  void initState() {
    super.initState();

    _chartData = widget.chartData;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final userBloc = BlocProvider.of<UserBloc>(context);
    final userBloc = UserBloc();
    // final counterBloc = BlocProvider.of<CounterBloc>(context);
    final counterBloc = CounterBloc();
    counterBloc.add(CounterIncEvent());

    return Column(
      children: [
        Container(
          height: 30,
          width: 285,
          // color: ThemeColors.purple,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            color: ThemeColors.purple,
          ),
        ),
        BlocBuilder<CounterBloc, int>(
            bloc: counterBloc,
            builder: (context, state) {
              return Container(
                  height: 187,
                  // color: ThemeColors.purple,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                    color: ThemeColors.darkPurple,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Number : $state",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              counterBloc.add(CounterIncEvent());
                            },
                            child: const Text('+'),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                counterBloc.add(CounterDecEvent());
                              },
                              child: const Text('-')),
                          ElevatedButton(
                              onPressed: () {
                                userBloc
                                    .add(UserGetUsersEvent(counterBloc.state));
                              },
                              child: const Text('Add user')),
                        ],
                      ),
                    ],
                  ));
            }),
        BlocBuilder<UserBloc, UserState>(
          bloc: userBloc,
          builder: (context, state) {
            return Container(
                margin: const EdgeInsets.only(top: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 300,
                        width: double.infinity,
                        // color: ThemeColors.purple,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24)),
                          color: ThemeColors.darkPurple,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            if (state is UserLoadingState)
                              const CircularProgressIndicator(),
                            if (state is UserLoadedState)
                              ...state.users
                                  .map((user) => Text(user.name))
                                  .toList(),
                          ],
                        ))
                  ],
                ));
          },
        ),
        Container(
            margin: const EdgeInsets.only(top: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Analytics",
                        style: TextStyle(color: Colors.white, fontSize: 24)),
                    Container(
                      height: 40,
                      width: 120,
                      // color: ThemeColors.purple,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: ThemeColors.darkPurple,
                      ),
                    )
                  ],
                ),
                BarChartSample3(chartData: widget.chartData)
              ],
            )),
        Container(
            margin: const EdgeInsets.only(top: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Analytics",
                        style: TextStyle(color: Colors.white, fontSize: 24)),
                    Container(
                      height: 40,
                      width: 120,
                      // color: ThemeColors.purple,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        color: ThemeColors.darkPurple,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24),

                  height: 187,
                  // color: ThemeColors.purple,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(24)),
                    color: ThemeColors.darkPurple,
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
