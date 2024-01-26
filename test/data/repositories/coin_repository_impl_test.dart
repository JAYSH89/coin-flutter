
import 'dart:io';
import 'dart:convert';

import 'package:coin_flutter/core/errors/server_exception.dart';
import 'package:coin_flutter/data/models/coins/coin_dto.dart';
import 'package:coin_flutter/data/models/trending/trending_response_dto.dart';
import 'package:coin_flutter/data/repositories/coin_repository_impl.dart';
import 'package:coin_flutter/domain/models/coins/coin.dart';
import 'package:coin_flutter/domain/models/trending/trending.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockCoinRemoteDataSource datasource;
  late CoinRepositoryImpl coinRepositoryImpl;

  setUp(() {
    datasource = MockCoinRemoteDataSource();
    coinRepositoryImpl = CoinRepositoryImpl(coinRemoteDataSource: datasource);
  });

  group('test coin repository searchTrending', () {
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

  group('test coin repository getAllCoins', () {
    test('should return List<Coin> when call datasource successful', () async {
      // arrange
      final jsonFile = readJson('helpers/dummy_data/dummy_coins_markets.json');
      final List<dynamic> jsonList = json.decode(jsonFile);
      final data = jsonList
          .map((e) => CoinDTO.fromJson(e as Map<String, dynamic>))
          .toList();

      when(datasource.getAllCoins())
          .thenAnswer((realInvocation) async => data);

      // act
      final result = await coinRepositoryImpl.getAllCoins();

      // assert
      expect(result, isA<List<Coin>>());
      expect(result.length, equals(100));

      verify(datasource.getAllCoins());
      verifyNoMoreInteractions(datasource);
    });

    test('should server failure if call datasource unsuccessful', () {
      // arrange
      when(datasource.getAllCoins()).thenThrow(ServerException());

      // act + assert
      expect(() async {
        await coinRepositoryImpl.getAllCoins();
      }, throwsA(isA<ServerException>()));

      verify(datasource.getAllCoins());
      verifyNoMoreInteractions(datasource);
    });

    test('should connection failure if no internet connection', () {
      // arrange
      when(datasource.getAllCoins())
          .thenThrow(const SocketException('Failed to connect to the network'));

      // act + assert
      expect(() async {
        await coinRepositoryImpl.getAllCoins();
      }, throwsA(isA<SocketException>()));

      verify(datasource.getAllCoins());
      verifyNoMoreInteractions(datasource);
    });
  });
}
