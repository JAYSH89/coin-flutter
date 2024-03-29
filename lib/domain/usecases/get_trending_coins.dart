import 'package:coin_flutter/domain/models/trending/trending.dart';
import 'package:coin_flutter/domain/repositories/coin_repository.dart';

class GetTrendingCoinsUseCase {
  final CoinRepository repository;

  GetTrendingCoinsUseCase(this.repository);

  Future<Trending> execute() async {
    return await repository.getTrendingCoins();
  }
}
