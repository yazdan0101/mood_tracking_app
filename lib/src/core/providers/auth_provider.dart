import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:mood_tracking_app/src/core/entities/user.dart';

enum AuthStatus { idle, loading, authenticated, error }

class AuthState {
  AuthState({this.status = AuthStatus.idle, this.token, this.error});

  final AuthStatus status;
  final String? token;
  final String? error;

  AuthState copyWith(
          {final AuthStatus? status,
          final String? token,
          final String? error}) =>
      AuthState(
        status: status ?? this.status,
        token: token ?? this.token,
        error: error ?? this.error,
      );
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState());

  Future<void> login(final User user, final String backendBaseUrl) async {
    state = state.copyWith(status: AuthStatus.loading);
    try {
      final response = await http.post(
        Uri.parse('$backendBaseUrl/api/login'),
        headers: {'Content-Type': 'application/json'},
        body:
            jsonEncode({'username': user.userName, 'password': user.password}),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        state = state.copyWith(
          status: AuthStatus.authenticated,
          token: data['token'],
        );
      } else {
        final err = jsonDecode(response.body)['error'] ?? 'Unknown error';
        state = state.copyWith(status: AuthStatus.error, error: err);
      }
    } catch (e) {
      state = state.copyWith(status: AuthStatus.error, error: e.toString());
    }
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (final ref) => AuthNotifier(),
);
