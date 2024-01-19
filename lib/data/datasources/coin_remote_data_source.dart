import 'package:coin_flutter/data/models/trending/trending_coin_dto.dart';
import 'package:coin_flutter/data/models/trending/trending_response_dto.dart';

abstract class CoinRemoteDataSource {
  Future<TrendingResponseDTO> searchTrending();
}
