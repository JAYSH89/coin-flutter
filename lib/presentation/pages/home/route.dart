import 'package:flutter/material.dart';

sealed class Destination {
  final String path;
  final String title;
  final IconData icon;

  Destination({required this.title, required this.path, required this.icon});
}

class Market extends Destination {
  Market() : super(title: 'Market', path: '/market', icon: Icons.storefront);
}

class Trending extends Destination {
  Trending()
      : super(
          title: 'Trending',
          path: '/trending',
          icon: Icons.trending_up,
        );
}

class Profile extends Destination {
  Profile() : super(title: 'Profile', path: '/profile', icon: Icons.person);
}
