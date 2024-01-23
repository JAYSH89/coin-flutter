import 'package:coin_flutter/presentation/pages/trending/trending_page.dart' as go_router;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const go_router.TrendingPage();
      },
    ),
  ],
);
