import 'package:coin_flutter/domain/models/trending.dart';

abstract class CoinRepository {
  search(String query);
  Future<List<Trending>> getTrendingCoins();
  getAllCoins();
  getCoin(String id);
  getCoinChart(String id, String currency, String days);
}
