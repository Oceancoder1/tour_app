import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState()) {
    on<LoadUserRequested>(_onLoadUser);
    on<ChangeUsernameRequested>(_onChangeUsername);
  }

  Future<void> _onChangeUsername(
    ChangeUsernameRequested event,
    Emitter<UserState> emit,
  ) async {
    // final index = state.users.indexWhere((user) => user.id == event.user.id);
    final newUser = event.user;
    final newUserList = state.users
        .map((user) => user.id == newUser.id ? newUser : user)
        .toList();
    emit(state.copyWith(
      status: UserStatus.success,
      users: newUserList,
    ));
  }

  Future<void> _onLoadUser(
    LoadUserRequested event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(
      status: UserStatus.success,
      users: User.users,
    ));
  }
}
