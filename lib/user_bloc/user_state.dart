// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

class UserState extends Equatable {
  const UserState({
    this.status = UserStatus.loading,
    this.users = const [],
  });

  final UserStatus status;
  final List<User> users;

  @override
  List<Object> get props => [
        status,
        users,
      ];

  UserState copyWith({
    UserStatus? status,
    List<User>? users,
  }) {
    return UserState(
      status: status ?? this.status,
      users: users ?? this.users,
    );
  }
}

enum UserStatus { loading, success }
