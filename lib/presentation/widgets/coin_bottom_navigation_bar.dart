import 'package:coin_flutter/presentation/pages/home/route.dart';
import 'package:flutter/material.dart';

class CoinBottomNavigationBar extends StatelessWidget {
  const CoinBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
    required this.routes,
  });

  final int currentIndex;
  final Function(int) onItemTapped;
  final List<Destination> routes;

  @override
  Widget build(BuildContext context) => Theme(
        data: ThemeData(useMaterial3: false),
        child: BottomNavigationBar(
          items: _items(),
          onTap: onItemTapped,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
        ),
      );

  List<BottomNavigationBarItem> _items() => routes
      .map((e) => BottomNavigationBarItem(
            icon: Icon(e.icon),
            label: e.title,
          ))
      .toList();
}
