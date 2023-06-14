part of "user_bloc.dart";

abstract class UsersState {}

class UsersInitialState extends UsersState {}

class UsersLoadedState extends UsersState {
  final List<User> users;

  UsersLoadedState(this.users);
}

class User {
  final String name;
  final String id;

  User({required this.name, required this.id});
}
