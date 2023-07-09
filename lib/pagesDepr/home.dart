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
    // final userBloc = UserBloc();
    // // final counterBloc = BlocProvider.of<CounterBloc>(context);
    // final counterBloc = CounterBloc();
    // counterBloc.add(CounterIncEvent());

    return Builder(builder: (context) {
      // final users = context.watch<UserBloc>().state;
      // final isLoading = context.select((UserBloc bloc) => bloc.state.isLoading);
      final counter = context.select((CounterBloc bloc) => bloc.state);
      final counterBloc = BlocProvider.of<CounterBloc>(context);
      final userBloc = BlocProvider.of<UserBloc>(context);

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
          Container(
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
                    "Number : ${counter}",
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
                            userBloc.add(UserGetUsersEvent(counter));
                            // userBloc
                            //     .add(UserGetUsersEvent(counterBloc.state));
                          },
                          child: const Text('Add user')),
                      ElevatedButton(
                          onPressed: () {
                            userBloc.add(UserGetUsersJobEvent(counter));
                            // userBloc.add(
                            //     UserGetUsersJobEvent(counterBloc.state));
                          },
                          child: const Text('Add Job')),
                    ],
                  ),
                ],
              )),
          BlocBuilder<CounterBloc, int>(
            builder: (context, state) {
              final users = context.select((UserBloc bloc) => bloc.state.users);

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
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // if (isLoading) const CircularProgressIndicator(),
                              if (users.isNotEmpty)
                                ...users
                                    .map((user) => Text(
                                          user.name,
                                          style: TextStyle(color: Colors.white),
                                        ))
                                    .toList(),
                            ],
                          ))
                    ],
                  ));
            },
          ),
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              final jobs = context.select((UserBloc bloc) => bloc.state.job);

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
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // if (isLoading) const CircularProgressIndicator(),
                              if (jobs.isNotEmpty)
                                ...jobs
                                    .map((job) => Text(
                                          job.name,
                                          style: TextStyle(color: Colors.white),
                                        ))
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
    });
  }
}
