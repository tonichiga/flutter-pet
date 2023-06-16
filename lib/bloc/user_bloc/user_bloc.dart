// part of "user_bloc.dart";

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/counter_bloc/counter_block.dart';
import 'package:my_app/bloc/user_bloc/user_events.dart';
import 'package:my_app/bloc/user_bloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final CounterBloc counterBloc;
  late final StreamSubscription counterSubscription;

  UserBloc(this.counterBloc) : super(UserState()) {
    on<UserGetUsersEvent>(_onGetUser);
    on<UserGetUsersJobEvent>(_onGetUserJob);
    counterSubscription = counterBloc.stream.listen((state) {
      if (state <= 0) {
        add(UserGetUsersEvent(0));
        add(UserGetUsersJobEvent(0));
      }
    });
  }

  @override
  Future<void> close() async {
    counterSubscription.cancel();
    return super.close();
  }

  _onGetUser(UserGetUsersEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(Duration(seconds: 1));
    final users = List.generate(
        event.count, (index) => User(name: "Bobby", id: index.toString()));
    emit(state.copyWith(users: users));
  }

  _onGetUserJob(UserGetUsersJobEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(Duration(seconds: 2));
    final job = List.generate(
        event.count, (index) => Job(name: "Electric", id: index.toString()));
    emit(state.copyWith(job: job));
  }
}
