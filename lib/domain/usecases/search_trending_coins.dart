import 'package:coin_flutter/domain/models/Trending.dart';
import 'package:coin_flutter/domain/repositories/coin_repository.dart';

class SearchTrendingCoins {
  final CoinRepository repository;

  SearchTrendingCoins(this.repository);

  Future<List<Trending>> call() async {
    return await repository.searchTrending();
  }
}
