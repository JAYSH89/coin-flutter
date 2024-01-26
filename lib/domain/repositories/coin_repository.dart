import 'package:coin_flutter/domain/models/coins/coin.dart';
import 'package:coin_flutter/domain/models/coins/coin_detail.dart';
import 'package:coin_flutter/domain/models/trending/trending.dart';

abstract class CoinRepository {
  Future<Trending> getTrendingCoins();

  Future<List<Coin>> getAllCoins();

  Future<CoinDetail> getCoin(String id);
}
