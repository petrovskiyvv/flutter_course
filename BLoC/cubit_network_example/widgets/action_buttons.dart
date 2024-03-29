
import 'package:bloc_example/bloc/user_bloc.dart';
import 'package:bloc_example/bloc/user_event.dart';
import 'package:bloc_example/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = context.read<UserBloc>();
    return Row(mainAxisSize: MainAxisSize.min, children: [
      ElevatedButton(
        onPressed: () {
          userBloc.add(UserLoadEvent());
        },
        child: Text('Load'),
        style: ElevatedButton.styleFrom(primary: Colors.green),
      ),
      SizedBox(
        width: 8,
      ),
      ElevatedButton(
        onPressed: () {
          userBloc.add(UserClearEvent());
        },
        child: Text('Clear'),
        style: ElevatedButton.styleFrom(primary: Colors.red),
      ),
    ]);
  }
}
