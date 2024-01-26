import 'dart:convert';
import 'dart:io';

import 'package:coin_flutter/core/errors/server_exception.dart';
import 'package:coin_flutter/data/models/coins/coin_detail_dto.dart';
import 'package:coin_flutter/data/models/coins/coin_dto.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:coin_flutter/core/constants/constants.dart';
import 'package:coin_flutter/data/datasources/coin_remote_data_source_impl.dart';
import 'package:coin_flutter/data/models/trending/trending_response_dto.dart';
import 'package:http/http.dart' as http;

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late CoinRemoteDataSourceImpl coinRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    coinRemoteDataSourceImpl = CoinRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get trending', () {
    test('should return weather model when the response code is 200', () async {
      // arrange
      var url = Uri.parse(Urls.SEARCH_TRENDING);

      /***
       * Somehow http.Response messes up the json file by not sanitizing
       * therefore converted to passing the content as a list of bytes.
       */
      final jsonString = readJson('helpers/dummy_data/dummy_trending.json');
      final List<int> jsonBytes = utf8.encode(jsonString);

      when(mockHttpClient.get(url))
          .thenAnswer((_) async => http.Response.bytes(jsonBytes, 200));

      // act
      final result = await coinRemoteDataSourceImpl.getTrendingCoins();

      // assert
      expect(result, isA<TrendingResponseDTO>());
    });

    test('should throw server exception when response code is not 200-299',
        () async {
      // arrange
      var url = Uri.parse(Urls.SEARCH_TRENDING);

      when(mockHttpClient.get(url))
          .thenAnswer((_) async => http.Response('Not found', 404));

      // act && assert
      expect(() async {
        await coinRemoteDataSourceImpl.getTrendingCoins();
      }, throwsA(isA<ServerException>()));
    });
  });

  group('get all coins', () {
    test('should return List<CoinDTO> when 200 OK', () async {
      // arrange
      const path = "${Urls.COINS_ALL}?currency=eur";
      final url = Uri.parse(path);

      final jsonString =
          readJson('helpers/dummy_data/dummy_coins_markets.json');
      final List<int> jsonBytes = utf8.encode(jsonString);

      when(mockHttpClient.get(url))
          .thenAnswer((_) async => http.Response.bytes(jsonBytes, 200));

      // act
      final result = await coinRemoteDataSourceImpl.getAllCoins();

      // assert
      expect(result, isA<List<CoinDTO>>());
      expect(result.length, equals(100));
    });

    test('get all coins should throw ServerException when status not 200-299',
        () {
      // arrange
      const path = "${Urls.COINS_ALL}?currency=eur";
      final url = Uri.parse(path);

      when(mockHttpClient.get(url))
          .thenAnswer((_) async => http.Response('Not found', 404));

      // act && assert
      expect(() async {
        await coinRemoteDataSourceImpl.getAllCoins();
      }, throwsA(isA<ServerException>()));
    });
  });

  group('get coin by id', () {
    test('should return CoinDetailDTO when 200 OK', () async {
      // arrange
      const id = "bitcoin";
      const path = "${Urls.COINS_DETAIL}/$id";
      final url = Uri.parse(path);

      final jsonString = readJson('helpers/dummy_data/dummy_coins_id.json');
      final List<int> jsonBytes = utf8.encode(jsonString);

      when(mockHttpClient.get(url))
          .thenAnswer((_) async => http.Response.bytes(jsonBytes, 200));

      // act
      final result = await coinRemoteDataSourceImpl.getCoin(id);

      // assert
      expect(result, isA<CoinDetailDTO>());
      expect(result.id, equals(id));
    });

    test('get coin by id should throw ServerException when status not 200-299',
        () {
      const id = "bitcoin";
      const path = "${Urls.COINS_DETAIL}/$id";
      final url = Uri.parse(path);

      when(mockHttpClient.get(url))
          .thenAnswer((_) async => http.Response('Not found', 404));

      // act && assert
      expect(() async {
        await coinRemoteDataSourceImpl.getCoin(id);
      }, throwsA(isA<ServerException>()));
    });
  });
}
