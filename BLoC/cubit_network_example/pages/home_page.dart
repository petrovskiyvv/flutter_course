import 'package:bloc_example/bloc/user_bloc.dart';
import 'package:bloc_example/bloc/user_state.dart';
import 'package:bloc_example/cubit/internet_cubit.dart';
import 'package:bloc_example/services/user_repository.dart';
import 'package:bloc_example/widgets/action_buttons.dart';
import 'package:bloc_example/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_event.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  // final userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) => UserRepository(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  UserBloc(userRepository: context.read<UserRepository>())
                    ..add(UserLoadEvent()),
            ),
            BlocProvider(create: (context) => ConnectionCubit()),
          ],
          child: Scaffold(
            appBar: AppBar(
              title: BlocBuilder<ConnectionCubit, MyConnectionState>(
                builder: (context, state) => state.connected
                    ? Text("User List (в сети)")
                    : Text(
                        "Нет соединения с интернет!",
                        style: TextStyle(color: Colors.red),
                      ),
              ),
              centerTitle: true,
            ),
            backgroundColor: Colors.white,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ActionButtons(),
                Expanded(child: UserList()),
              ],
            ),
          ),
        ));
  }
}
