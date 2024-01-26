import 'package:coin_flutter/presentation/pages/home/home_page.dart';
import 'package:coin_flutter/presentation/pages/market/market_page.dart';
import 'package:coin_flutter/presentation/pages/trending/trending_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/trending',
  routes: [
    ShellRoute(
      builder: (context, state, child) => HomePage(child: child),
      routes: <RouteBase>[
        GoRoute(
          path: '/trending',
          builder: (_, __) => const TrendingPage(),
        ),
        GoRoute(
          path: '/markets',
          builder: (_, __) => const MarketPage(),
        ),
      ],
    )
  ],
);
