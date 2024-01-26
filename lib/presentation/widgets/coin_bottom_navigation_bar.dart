import 'package:flutter/material.dart';

class CoinBottomNavigationBar extends StatelessWidget {
  const CoinBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  final int currentIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) => Theme(
        data: ThemeData(useMaterial3: false),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Calls'),
            BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'Camera'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
          ],
          onTap: onItemTapped,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
        ),
      );
}
