import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tour_app/widgets/loading_widget.dart';

import '../user_bloc/user_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('Top Heroes'),
        SizedBox(
          height: 20,
        ),
        BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            switch (state.status) {
              case UserStatus.loading:
                return const LoadingWidget();

              case UserStatus.success:
                final users = state.users.where((user) => user.isTop).toList();

                return Wrap(
                  runSpacing: 20,
                  spacing: 20,
                  children: [
                    ...users
                        .map(
                          (user) => ElevatedButton(
                            onPressed: () {
                              context.goNamed(
                                'userDetails',
                                params: {
                                  'id': user.id.toString(),
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(20),
                              backgroundColor: Colors.blueGrey,
                              foregroundColor: Colors.white,
                            ),
                            child: Text(user.name),
                          ),
                        )
                        .toList()
                  ],
                );
            }
          },
        ),
      ],
    );
  }
}
