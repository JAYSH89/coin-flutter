import 'package:coin_flutter/data/models/coins/coin_detail_dto.dart';
import 'package:coin_flutter/data/models/coins/coin_dto.dart';
import 'package:coin_flutter/data/models/trending/trending_response_dto.dart';

abstract class CoinRemoteDataSource {
  Future<TrendingResponseDTO> getTrendingCoins();
  Future<List<CoinDTO>> getAllCoins();
  Future<CoinDetailDTO> getCoin(String id);
}
