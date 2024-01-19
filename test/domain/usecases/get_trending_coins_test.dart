import 'package:coin_flutter/domain/models/trending.dart';
import 'package:coin_flutter/domain/usecases/get_trending_coins.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTrendingCoinsUseCase getTrendingCoins;
  late MockCoinRepository mockCoinRepository;

  setUp(() {
    mockCoinRepository = MockCoinRepository();
    getTrendingCoins = GetTrendingCoinsUseCase(mockCoinRepository);
  });

  final testCoinsList = [
    const Trending(
      id: "biconomy",
      coinId: 21061,
      name: "Biconomy",
      symbol: "BICO",
      marketCapRank: 212,
      thumbUrl:
          "https://assets.coingecko.com/coins/images/21061/thumb/biconomy_logo.jpg?1696520444",
      smallUrl:
          "https://assets.coingecko.com/coins/images/21061/small/biconomy_logo.jpg?1696520444",
      largeUrl:
          "https://assets.coingecko.com/coins/images/21061/large/biconomy_logo.jpg?1696520444",
      slug: "biconomy",
    ),
    const Trending(
      id: "telos",
      coinId: 7588,
      name: "Telos",
      symbol: "TLOS",
      marketCapRank: 419,
      thumbUrl:
          "https://assets.coingecko.com/coins/images/7588/thumb/TLOS.png?1704499537",
      smallUrl:
          "https://assets.coingecko.com/coins/images/7588/small/TLOS.png?1704499537",
      largeUrl:
          "https://assets.coingecko.com/coins/images/7588/large/TLOS.png?1704499537",
      slug: "telos",
    ),
  ];

  test('should get trending coins from the repository successful', () async {
    // arrange
    when(mockCoinRepository.getTrendingCoins())
        .thenAnswer((_) async => testCoinsList);

    // act
    final result = await getTrendingCoins.execute();

    // assert
    expect(result, testCoinsList);
    verify(mockCoinRepository.getTrendingCoins());
    verifyNoMoreInteractions(mockCoinRepository);
  });
}
