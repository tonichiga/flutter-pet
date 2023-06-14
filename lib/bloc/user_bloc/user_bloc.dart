
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserGetUsersEvent>((event, emit) {});
  }

  _onGetUser(UserGetUserEvent event, Emitter<UserState> state) async {
    await Future.delayed(Duration(seconds: 1));
    final users = List.generate(, () => User(name, email, password, id));
    emit(UserLoadedState());
  }
}
