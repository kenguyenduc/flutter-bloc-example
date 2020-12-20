import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/get_user_state.dart';
import 'package:flutter_bloc_example/bloc/user_event.dart';
import 'package:flutter_bloc_example/model/user.dart';

class GetUsersBloc extends Bloc<UsersEvent, GetUsersState>{
  GetUsersBloc() : super(GetUsersUnInitial());

  @override
  Stream<GetUsersState> mapEventToState(UsersEvent event) async*{
    // to notify that is loading
    yield GetUsersLoading();
    // if you have multiple event
    if(event is GetUsersEvent){
      yield GetUsersSuccess(listUsers());
    }
    // if have error you can yield GetUsersError state
  }

}
