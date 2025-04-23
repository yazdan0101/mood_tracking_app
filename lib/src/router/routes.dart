import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracking_app/src/features/comment_page/comment_page.dart';
import 'package:mood_tracking_app/src/features/details/details_page.dart';
import 'package:mood_tracking_app/src/features/home/home_page.dart';
import 'package:mood_tracking_app/src/features/login_page/login_page.dart';
part 'routes.g.dart';

@TypedGoRoute<LoginRoute>(
  path: '/login',
)
class LoginRoute extends GoRouteData {
  LoginRoute();

  @override
  Widget build(
    final BuildContext context,
    final GoRouterState state,
  ) =>
      const LoginPage();
}

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
      const DetailsPage();
}

@TypedGoRoute<MoodCommentRoute>(
  path: '/mood_comment',
)
class MoodCommentRoute extends GoRouteData {
  MoodCommentRoute();

  @override
  Widget build(
    final BuildContext context,
    final GoRouterState state,
  ) =>
      const CommentPage();
}
