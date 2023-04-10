// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_api_with_bloc/bloc/home_bloc.dart';

import 'package:rest_api_with_bloc/models/user_model.dart';

class BlocPage extends StatelessWidget {
  const BlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BlocPage'),
      ),
      body: Center(child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeInitial) {
            return const Text('initial state');
          } else if (state is HomeLoading) {
            return const CircularProgressIndicator();
          } else if (state is HomeSucces) {
            return UserListBuilder(users: state.users);
          } else if (state is HomeError) {
            return const Text('error state');
          } else {
            return const Text('default state');
          }
        },
      )),
    );
  }
}

class UserListBuilder extends StatelessWidget {
  const UserListBuilder({
    super.key,
    required this.users,
  });
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Card(
            child: ListTile(
              title: Text(user.name),
              subtitle: Text(user.username),
            ),
          );
        });
  }
}
