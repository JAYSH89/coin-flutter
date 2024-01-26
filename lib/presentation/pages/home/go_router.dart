import 'package:coin_flutter/presentation/pages/home/home_page.dart';
import 'package:coin_flutter/presentation/pages/home/route.dart';
import 'package:coin_flutter/presentation/pages/market/market_page.dart';
import 'package:coin_flutter/presentation/pages/profile/profile_page.dart';
import 'package:coin_flutter/presentation/pages/trending/trending_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: Market().path,
  routes: [
    ShellRoute(
      builder: (_, state, child) => HomePage(routerState: state, child: child),
      routes: <RouteBase>[
        GoRoute(
          path: Market().path,
          builder: (_, __) => const MarketPage(),
        ),
        GoRoute(
          path: Trending().path,
          builder: (_, __) => const TrendingPage(),
        ),
        GoRoute(
          path: Profile().path,
          builder: (_, __) => const ProfilePage(),
        ),
      ],
    )
  ],
);
