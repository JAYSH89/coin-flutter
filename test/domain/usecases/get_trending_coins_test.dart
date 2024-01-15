import 'package:coin_flutter/domain/models/Trending.dart';
import 'package:coin_flutter/domain/usecases/search_trending_coins.dart';
import 'package:mockito/mockito.dart';
import 'package:coin_flutter/domain/repositories/coin_repository.dart';
import 'package:flutter_test/flutter_test.dart';

class MockCoinRepository extends Mock implements CoinRepository {}

void main() {
  late SearchTrendingCoins searchTrendingCoins;
  late MockCoinRepository mockCoinRepository;

  setUp(() {
    mockCoinRepository = MockCoinRepository();
    searchTrendingCoins = SearchTrendingCoins(mockCoinRepository);
  });

  final tCoinsList = [
    Trending(
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
    Trending(
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
    // Arrange
    when(mockCoinRepository.searchTrending())
        .thenAnswer((_) async => tCoinsList);

    // Act
    final result = await searchTrendingCoins();

    // Assert
    expect(result, tCoinsList);
    verify(mockCoinRepository.searchTrending());
    verifyNoMoreInteractions(mockCoinRepository);
  });
}
