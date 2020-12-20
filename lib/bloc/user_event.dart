class UsersEvent {}

class GetUsersEvent extends UsersEvent {
  String id;
  GetUsersEvent({this.id});
}
