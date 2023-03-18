import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tour_app/screens/home_screen.dart';
import 'package:tour_app/screens/user_details_screen.dart';
import 'package:tour_app/user_bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..add(const LoadUserRequested()),
      child: Builder(builder: (context) {
        return MaterialApp.router(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routerConfig: GoRouter(
            routes: [
              GoRoute(
                path: '/',
                name: 'home',
                builder: (context, state) => const HomeScreen(),
                routes: [
                  GoRoute(
                    path: 'userDetails/:id',
                    name: 'userDetails',
                    builder: (context, state) {
                      final user = context
                          .read<UserBloc>()
                          .state
                          .users
                          .firstWhere((user) =>
                              user.id.toString() == state.params['id']);
                      return UserDetailsScreen(
                        user: user,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}

// final router = GoRouter(
//   routes: [
//     GoRoute(
//       path: '/',
//       name: 'home',
//       builder: (context, state) => const HomeScreen(),
//       routes: [
//         GoRoute(
//           path: 'userDetails/:id',
//           name: 'userDetails',
//           builder: (context, state) {
//             return UserDetailsScreen(
//               id: state.params['id']!,
//             );
//           },
//         ),
//       ],
//     ),
//     // GoRoute(
//     //   path: '/userDetails',
//     //   builder: (context, state) => const UserDetailsScreen(),
//     // ),
//   ],
// );
