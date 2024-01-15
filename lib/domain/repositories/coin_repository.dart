import 'package:coin_flutter/domain/models/Trending.dart';

abstract class CoinRepository {
  search();
  Future<List<Trending>> searchTrending();
  getAllCoins();
  getCoin();
  getCoinChart();
}
