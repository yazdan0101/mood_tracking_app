import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracking_app/src/router/routes.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(final Ref ref) {
  return GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: $appRoutes,
    errorPageBuilder: (final context, final state) => const MaterialPage(
      child: Scaffold(
        body: Center(
          child: Text('Page not found'),
        ),
      ),
    ),
  );
}
