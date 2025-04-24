import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:mood_tracking_app/src/core/entities/mood_entry.dart';
import 'package:mood_tracking_app/src/core/providers/auth_provider.dart';
import 'package:mood_tracking_app/src/core/providers/base_backend_url_provider.dart';

final postMoodEntryProvider =
    FutureProvider.family<void, MoodEntry>((final ref, final entry) async {
  final authState = ref.read(authProvider);
  final token = authState.token;
  if (authState.status != AuthStatus.authenticated || token == null) {
    throw Exception('Not authenticated');
  }
  final baseUrl = ref.read(baseBackendUrlProvider);
  final uri = Uri.parse('$baseUrl/api/mood-entries');
  final response = await http
      .post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(entry.toJson()),
      )
      .timeout(const Duration(seconds: 10));

  if (response.statusCode != 201) {
    final body = jsonDecode(response.body);
    throw Exception(body['error'] ?? 'Failed to create mood entry');
  }
});
