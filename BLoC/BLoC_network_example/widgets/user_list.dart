import 'dart:developer';

import 'package:bloc_example/bloc/user_bloc.dart';
import 'package:bloc_example/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: ((context, state) {
        log(state.toString());
        if (state is UserLoadedState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("User is Loaded"),
          ));
        }
      }),
      builder: (BuildContext context, UserState state) {
        if (state is UserEmptyState) {
          return const Center(
            child: Text(
              "No data receives.",
              style: TextStyle(fontSize: 20),
            ),
          );
        }

        if (state is UserLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is UserLoadedState) {
          return ListView.builder(
            itemCount: state.loadedUser.length,
            itemBuilder: (context, index) => Container(
              color: index % 2 == 0 ? Colors.white : Colors.blue[50],
              child: ListTile(
                leading: Text(
                  'ID: ${state.loadedUser[index].id}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                title: Column(
                  children: [
                    Text(
                      state.loadedUser[index].name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Column(children: [
                      Text(
                        "email: ${state.loadedUser[index].email}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Phone: ${state.loadedUser[index].phone}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ]),
                  ],
                ),
              ),
            ),
          );
        }

        if (state is UserErrorState) {
          return const Center(
            child: Text(
              "Error fetching users",
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
