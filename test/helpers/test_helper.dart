import 'package:coin_flutter/domain/usecases/get_trending_coins.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

import 'package:coin_flutter/domain/repositories/coin_repository.dart';
import 'package:coin_flutter/data/datasources/coin_remote_data_source.dart';

@GenerateMocks(
  [
    CoinRepository,
    CoinRemoteDataSource,
    GetTrendingCoinsUseCase,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
