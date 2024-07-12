import 'package:flutter/material.dart';
import 'package:fluttermentor/pages/home/home_view.dart';
import 'package:go_router/go_router.dart';
import '../pages/splash/splash_view.dart';

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(path: "/", builder: (context, state) => const SplasView()),
  GoRoute(
    path: "/home",
    builder: (BuildContext context, GoRouterState state) {
      return const HomeView();
    },
  )
]);
