import 'package:coin_flutter/domain/models/coins/coin.dart';
import 'package:coin_flutter/domain/usecases/get_all_coins.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetAllCoinsUseCase getAllCoins;
  late MockCoinRepository mockCoinRepository;

  setUp(() {
    mockCoinRepository = MockCoinRepository();
    getAllCoins = GetAllCoinsUseCase(mockCoinRepository);
  });

  final List<Coin> testAllCoins = [];

  test('should get all coins from repository successful', () async {
    // arrange
    when(mockCoinRepository.getAllCoins())
        .thenAnswer((_) async => testAllCoins);

    // act
    final result = await getAllCoins.execute();

    // assert
    expect(result, isA<List<Coin>>());

    verify(mockCoinRepository.getAllCoins());
    verifyNoMoreInteractions(mockCoinRepository);
  });
}
