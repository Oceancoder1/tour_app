import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tour_app/widgets/loading_widget.dart';

import '../user_bloc/user_bloc.dart';

class HeroesScreen extends StatelessWidget {
  const HeroesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(20),
      children: [
        const Text('My Heroes'),
        const SizedBox(
          height: 20,
        ),
        BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            switch (state.status) {
              case UserStatus.loading:
                return const LoadingWidget();

              case UserStatus.success:
                final users = state.users;

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];

                    return Card(
                      elevation: 4,
                      child: ListTile(
                        onTap: () {
                          context.goNamed(
                            'userDetails',
                            params: {
                              'id': user.id.toString(),
                            },
                          );
                        },
                        leading: Text(user.id.toString()),
                        title: Text(user.name),
                      ),
                    );
                  },
                );
            }
          },
        ),
      ],
    );
  }
}
