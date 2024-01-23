import 'package:coin_flutter/domain/models/trending/trending.dart';
import 'package:coin_flutter/domain/usecases/get_trending_coins.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetTrendingCoinsUseCase getTrendingCoins;
  late MockCoinRepository mockCoinRepository;

  setUp(() {
    mockCoinRepository = MockCoinRepository();
    getTrendingCoins = GetTrendingCoinsUseCase(mockCoinRepository);
  });

  final Trending testTrending = Trending(
    coins: List.empty(),
    nfts: List.empty(),
    categories: List.empty(),
  );

  test('should get trending coins from the repository successful', () async {
    // arrange
    when(mockCoinRepository.getTrendingCoins())
        .thenAnswer((_) async => testTrending);

    // act
    final result = await getTrendingCoins.execute();

    // assert
    expect(result, isA<Trending>());
    expect(result, testTrending);
    verify(mockCoinRepository.getTrendingCoins());
    verifyNoMoreInteractions(mockCoinRepository);
  });
}
