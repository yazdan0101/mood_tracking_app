import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracking_app/src/features/home/presentation/home_page.dart';
import 'package:mood_tracking_app/src/features/mood_details/presentation/mood_details_page.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
)
class HomeRoute extends GoRouteData {
  HomeRoute();

  @override
  Widget build(
    final BuildContext context,
    final GoRouterState state,
  ) =>
      const HomePage();
}

@TypedGoRoute<MoodDetailsRoute>(
  path: '/mood_details',
)
class MoodDetailsRoute extends GoRouteData {
  MoodDetailsRoute();

  @override
  Widget build(
    final BuildContext context,
    final GoRouterState state,
  ) =>
      const MoodDetailsPage();
}
