import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_tracking_app/src/core/entities/user.dart';

class UserNotifier extends StateNotifier<User?> {
  UserNotifier() : super(User(userName: 'userName', password: 'password'));

  void updateUser(final User user) {
    state = user;
  }
}

final userProvider =
    StateNotifierProvider<UserNotifier, User?>((final ref) => UserNotifier());
