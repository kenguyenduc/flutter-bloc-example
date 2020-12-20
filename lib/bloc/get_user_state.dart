import 'package:flutter_bloc_example/model/user.dart';

class GetUsersState{}

class GetUsersUnInitial extends GetUsersState {}

class GetUsersLoading extends GetUsersState {}

class GetUsersSuccess extends GetUsersState {
  List<User> users;

  GetUsersSuccess(this.users) : assert(users != null);
}

class GetUsersError extends GetUsersState {}
