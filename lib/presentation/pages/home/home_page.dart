import 'package:coin_flutter/presentation/widgets/coin_app_bar.dart';
import 'package:coin_flutter/presentation/widgets/coin_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.child});

  final Widget child;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const CoinAppBar(title: 'Markets'),
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

    switch (index) {
      case 0:
        return context.go('/trending');
      case 1:
        return context.go('/markets');
    }
  }
}
