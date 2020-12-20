import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/bloc/get_user_bloc.dart';
import 'package:flutter_bloc_example/bloc/get_user_state.dart';
import 'package:flutter_bloc_example/bloc/user_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/model/user.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GetUsersBloc _getUsersBloc;

  @override
  void initState() {
    super.initState();
    _getUsersBloc = GetUsersBloc();
  }

  @override
  Widget build(BuildContext context) {
    _getUsersBloc.add(GetUsersEvent());
    return BlocProvider(
        create: (context) => _getUsersBloc,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Demo BLoC"),
            centerTitle: true,
          ),
          body: BlocBuilder(
            cubit: _getUsersBloc,
            builder: (context, GetUsersState state) {
              if (state is GetUsersUnInitial)
                return Container();
              else if (state is GetUsersLoading)
                return Center(child: CircularProgressIndicator());
              else if (state is GetUsersSuccess)
                return _buildListUser(state.users);
              else {
                return Center(child: Text("Error"));
              }
            },
          ),
        ));
  }

  Widget _buildListUser(List<User> users) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(users[index].avatar),
            ),
            title: Text(
              users[index].name,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            subtitle: Text(
              users[index].address,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 1,
          );
        },
        itemCount: users.length);
  }
}
