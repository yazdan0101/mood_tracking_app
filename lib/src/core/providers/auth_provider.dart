import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

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

  Future<void> login(final String username, final String password) async {
    state = state.copyWith(status: AuthStatus.loading);
    try {
      final response = await http.post(
        Uri.parse('$backendBaseUrl/api/login'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}),
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

String get backendBaseUrl {
  if (kIsWeb) {
    return 'http://localhost:8000';
  }

  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
      return 'http://10.0.2.2:8000';
    default:
      return 'http://localhost:8000';
  }
}
