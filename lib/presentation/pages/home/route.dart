sealed class Destination {
  final String path;
  final String title;

  Destination({required this.title, required this.path});
}

class Market extends Destination {
  Market() : super(title: 'Market', path: '/market');
}

class Trending extends Destination {
  Trending() : super(title: 'Trending', path: '/trending');
}

class Profile extends Destination {
  Profile() : super(title: 'Profile', path: '/profile');
}
