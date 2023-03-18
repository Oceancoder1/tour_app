// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:tour_app/models/user.dart';
import 'package:tour_app/user_bloc/user_bloc.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  late User user;

  @override
  void initState() {
    super.initState();
    user = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heroes Details'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('${user.name} Details'),
          const SizedBox(
            height: 15,
          ),
          Text('Id: ${user.id}'),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const Text('Hero Name'),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: TextFormField(
                  initialValue: user.name,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      user = user.copyWith(name: value);
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () {
                context
                    .read<UserBloc>()
                    .add(ChangeUsernameRequested(user: user));
                context.goNamed('home');
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
                backgroundColor: Colors.grey.shade100,
                foregroundColor: Colors.black,
              ),
              child: const Text('Back'),
            ),
          ),
        ],
      ),
    );
  }
}
