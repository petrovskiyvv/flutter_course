import 'package:bloc_example/bloc/user_bloc.dart';
import 'package:bloc_example/services/user_repository.dart';
import 'package:bloc_example/widgets/action_buttons.dart';
import 'package:bloc_example/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => UserBloc(userRepository: userRepository),
      child: Scaffold(appBar: AppBar(
      title: const Text('User List'),
      centerTitle: true,
    ),
      backgroundColor: Colors.white,
      body: Column(crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ActionButtons(),
        Expanded(child: UserList()),
      ],),),
    );
  }
}
