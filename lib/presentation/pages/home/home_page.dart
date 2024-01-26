import 'package:coin_flutter/presentation/pages/home/route.dart';
import 'package:coin_flutter/presentation/widgets/coin_app_bar.dart';
import 'package:coin_flutter/presentation/widgets/coin_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.routerState,
    required this.child,
  });

  final GoRouterState routerState;
  final Widget child;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Destination> routes = [Market(), Trending(), Profile()];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: CoinAppBar(title: _getTitle()),
        body: widget.child,
        bottomNavigationBar: CoinBottomNavigationBar(
          currentIndex: _currentIndex,
          onItemTapped: _onItemTapped,
        ),
      );

  void _onItemTapped(int index) {
    if (index == _currentIndex) return;

    setState(() {
      _currentIndex = index;
    });

    context.go(routes[index].path);
  }

  String _getTitle() => routes
      .firstWhere(
        (element) => element.path == widget.routerState.matchedLocation,
      )
      .title;
}
