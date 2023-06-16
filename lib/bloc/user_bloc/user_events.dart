abstract class UserEvent {}

class UserGetUsersEvent extends UserEvent {
  final int count;

  UserGetUsersEvent(this.count);
}

class UserGetUsersJobEvent extends UserEvent {
  final int count;

  UserGetUsersJobEvent(this.count);
}
