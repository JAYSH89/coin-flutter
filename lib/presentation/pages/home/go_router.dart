import 'package:coin_flutter/presentation/pages/home/home_page.dart';
import 'package:coin_flutter/presentation/pages/market/market_page.dart';
import 'package:coin_flutter/presentation/pages/profile/profile_page.dart';
import 'package:coin_flutter/presentation/pages/trending/trending_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/market',
  routes: [
    ShellRoute(
      builder: (context, state, child) => HomePage(
        routerState: state,
        child: child,
      ),
      routes: <RouteBase>[
        GoRoute(
          path: '/market',
          builder: (_, __) => const MarketPage(),
        ),
        GoRoute(
          path: '/trending',
          builder: (_, __) => const TrendingPage(),
        ),
        GoRoute(
          path: '/profile',
          builder: (_, __) => const ProfilePage(),
        ),
      ],
    )
  ],
);
