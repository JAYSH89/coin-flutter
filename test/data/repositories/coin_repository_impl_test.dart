import 'dart:io';

import 'package:coin_flutter/core/errors/server_exception.dart';
import 'package:coin_flutter/data/models/trending/trending_response_dto.dart';
import 'package:coin_flutter/data/repositories/coin_repository_impl.dart';
import 'package:coin_flutter/domain/models/trending/trending.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockCoinRemoteDataSource datasource;
  late CoinRepositoryImpl coinRepositoryImpl;

  const testTrending = Trending(
    coins: [],
    nfts: [],
    categories: [],
  );

  const testTrendingDTO = TrendingResponseDTO(
    coins: [],
    nfts: [],
    categories: [],
  );

  setUp(() {
    datasource = MockCoinRemoteDataSource();
    coinRepositoryImpl = CoinRepositoryImpl(coinRemoteDataSource: datasource);
  });

  group('test coin repository searchTrending', () {
    test('should return trending when call datasource successful', () async {
      // arrange
      when(datasource.getTrendingCoins())
          .thenAnswer((realInvocation) async => testTrendingDTO);

      // act
      final result = await coinRepositoryImpl.getTrendingCoins();

      // assert
      expect(result, equals(testTrending));
      verify(datasource.getTrendingCoins());
      verifyNoMoreInteractions(datasource);
    });

    test('should server failure if call datasource unsuccessful', () async {
      // arrange
      when(datasource.getTrendingCoins()).thenThrow(ServerException());

      // act && assert
      expect(() async {
        await coinRepositoryImpl.getTrendingCoins();
      }, throwsA(isA<ServerException>()));
      verify(datasource.getTrendingCoins());
      verifyNoMoreInteractions(datasource);
    });

    test('should connection failure if device has no internet connection',
        () async {
      // arrange
      when(datasource.getTrendingCoins())
          .thenThrow(const SocketException('Failed to connect to the network'));

      // act && assert
      expect(() async {
        await coinRepositoryImpl.getTrendingCoins();
      }, throwsA(isA<SocketException>()));
      verify(datasource.getTrendingCoins());
      verifyNoMoreInteractions(datasource);
    });
  });
}
