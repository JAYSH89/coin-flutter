import 'package:coin_flutter/domain/models/coins/coin_detail.dart';
import 'package:coin_flutter/domain/usecases/get_coin.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetCoinUseCase getCoin;
  late MockCoinRepository mockCoinRepository;

  setUp(() {
    mockCoinRepository = MockCoinRepository();
    getCoin = GetCoinUseCase(mockCoinRepository);
  });

  final CoinDetail testCoin = CoinDetail(
    id: "bitcoin",
    symbol: "btc",
    name: "Bitcoin",
    webSlug: "bitcoin",
    description: 'description',
    thumbImage: 'thumbImage',
    smallImage: 'smallImage',
    largeImage: 'largeImage',
    marketCapRank: 1,
    lastUpdated: DateTime.parse("2024-01-24T00:29:50.869Z"),
  );

  test('should get coin detail from repository successful', () async {
    // arrange
    when(mockCoinRepository.getCoin(testCoin.id))
        .thenAnswer((_) async => testCoin);

    // act
    final result = await getCoin.execute(testCoin.id);

    // assert
    expect(result, isA<CoinDetail>());
    expect(result, testCoin);

    verify(mockCoinRepository.getCoin(any));
    verifyNoMoreInteractions(mockCoinRepository);
  });
}
