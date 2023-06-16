// part of "user_bloc.dart";

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/user_bloc/user_events.dart';
import 'package:my_app/bloc/user_bloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState()) {
    on<UserGetUsersEvent>(_onGetUser);
    on<UserGetUsersJobEvent>(_onGetUserJob);
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
