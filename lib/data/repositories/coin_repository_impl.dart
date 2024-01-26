import 'package:coin_flutter/data/datasources/coin_remote_data_source.dart';
import 'package:coin_flutter/data/models/coins/coin_detail_dto.dart';
import 'package:coin_flutter/data/models/coins/coin_dto.dart';
import 'package:coin_flutter/data/models/trending/trending_response_dto.dart';
import 'package:coin_flutter/domain/models/coins/coin.dart';
import 'package:coin_flutter/domain/models/coins/coin_detail.dart';
import 'package:coin_flutter/domain/models/trending/trending.dart';

import '../../domain/repositories/coin_repository.dart';

class CoinRepositoryImpl extends CoinRepository {
  final CoinRemoteDataSource coinRemoteDataSource;

  CoinRepositoryImpl({required this.coinRemoteDataSource});

  @override
  Future<Trending> getTrendingCoins() async {
    final response = await coinRemoteDataSource.getTrendingCoins();
    return response.toTrending();
  }

  @override
  Future<List<Coin>> getAllCoins() async {
    final response = await coinRemoteDataSource.getAllCoins();
    final List<Coin> result = response.map((dto) => dto.toCoin()).toList();
    return result;
  }

  @override
  Future<CoinDetail> getCoin(String id) async {
    final response = await coinRemoteDataSource.getCoin(id);
    return response.toCoinDetail();
  }
}
