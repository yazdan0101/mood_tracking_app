import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../features/home/presentation/home_page.dart';
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