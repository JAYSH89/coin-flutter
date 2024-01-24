import 'package:coin_flutter/data/datasources/coin_remote_data_source.dart';
import 'package:coin_flutter/data/models/trending/trending_response_dto.dart';
import 'package:coin_flutter/domain/models/trending/trending.dart';

import '../../domain/repositories/coin_repository.dart';

class CoinRepositoryImpl extends CoinRepository {
  final CoinRemoteDataSource coinRemoteDataSource;

  CoinRepositoryImpl({required this.coinRemoteDataSource});

  @override
  getAllCoins() {
    // TODO: implement getAllCoins
    throw UnimplementedError();
  }

  @override
  getCoin(String id) {
    // TODO: implement getCoin
    throw UnimplementedError();
  }

  @override
  getCoinChart(String id, String currency, String days) {
    // TODO: implement getCoinChart
    // Dummy = bitcoin - eur - 30
    throw UnimplementedError();
  }

  @override
  Future<Trending> getTrendingCoins() async {
    final result = await coinRemoteDataSource.searchTrending();
    return result.toTrending();
  }

  @override
  search(String query) {
    // TODO: implement search
    throw UnimplementedError();
  }

}
