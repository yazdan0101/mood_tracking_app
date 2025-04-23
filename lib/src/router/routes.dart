import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracking_app/src/features/comment_page/comment_page.dart';
import 'package:mood_tracking_app/src/features/details_page/details_page.dart';
import 'package:mood_tracking_app/src/features/home_page/home_page.dart';
import 'package:mood_tracking_app/src/features/login_page/login_page.dart';
import 'package:mood_tracking_app/src/features/successful_page/successful_page.dart';

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

@TypedGoRoute<DetailsRoute>(
  path: '/details',
)
class DetailsRoute extends GoRouteData {
  DetailsRoute();

  @override
  Widget build(
    final BuildContext context,
    final GoRouterState state,
  ) =>
      const DetailsPage();
}

@TypedGoRoute<CommentRoute>(
  path: '/comment',
)
class CommentRoute extends GoRouteData {
  CommentRoute();

  @override
  Widget build(
    final BuildContext context,
    final GoRouterState state,
  ) =>
      const CommentPage();
}

@TypedGoRoute<SuccessfulRoute>(
  path: '/successful',
)
class SuccessfulRoute extends GoRouteData {
  SuccessfulRoute();

  @override
  Widget build(
    final BuildContext context,
    final GoRouterState state,
  ) =>
      const SuccessfulPage();
}
