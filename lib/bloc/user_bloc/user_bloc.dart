// part of "user_bloc.dart";

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/user_bloc/user_events.dart';
import 'package:my_app/bloc/user_bloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitialState()) {
    on<UserGetUsersEvent>(_onGetUser);
  }

  _onGetUser(UserGetUsersEvent event, Emitter<UserState> emit) async {
    emit(UserLoadingState());

    await Future.delayed(Duration(seconds: 1));
    final users = List.generate(
        event.count, (index) => User(name: "Bobby", id: index.toString()));
    emit(UserLoadedState(users));
  }
}
