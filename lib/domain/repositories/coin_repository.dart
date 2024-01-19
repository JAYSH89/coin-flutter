import 'package:coin_flutter/domain/models/trending/trending.dart';

abstract class CoinRepository {
  search(String query);
  Future<Trending> getTrendingCoins();
  getAllCoins();
  getCoin(String id);
  getCoinChart(String id, String currency, String days);
}
