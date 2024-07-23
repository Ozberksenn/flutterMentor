import 'package:flutter/material.dart';
import 'package:fluttermentor/features/model/all_characterse.dart';
import 'package:fluttermentor/features/view/detail/detail_view.dart';
import 'package:fluttermentor/product/router/app_routes.dart';
import 'package:go_router/go_router.dart';
import '../../features/view/home/home_view.dart';
import '../../features/view/splash/splash_view.dart';

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(
      path: AppRoutes.path(AppRoutes.splash),
      builder: (context, state) => const SplasView()),
  GoRoute(
      path: AppRoutes.path(AppRoutes.home),
      name: AppRoutes.home,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeView();
      },
      routes: [
        GoRoute(
            path: "AppRoutes.detail",
            name: AppRoutes.detail,
            builder: (context, state) {
              AllCharacters characters = state.extra as AllCharacters;
              return DetailView(characters: characters);
            })
      ]),
]);
