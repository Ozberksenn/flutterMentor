import 'package:flutter/material.dart';
import 'package:fluttermentor/product/router/app_routes.dart';
import 'package:go_router/go_router.dart';

import '../../features/view/home/home_view.dart';
import '../../features/view/splash/splash_view.dart';

final GoRouter router = GoRouter(routes: <RouteBase>[
  GoRoute(path: "/", builder: (context, state) => const SplasView()),
  GoRoute(
    path: AppRoutes.path(AppRoutes.home),
    name: AppRoutes.home,
    builder: (BuildContext context, GoRouterState state) {
      return const HomeView();
    },
  )
]);
