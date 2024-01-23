import 'dart:convert';
import 'dart:io';

import 'package:coin_flutter/core/errors/server_exception.dart';
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

      when(mockHttpClient.get(url)).thenAnswer((_) async => http.Response.bytes(
            jsonBytes,
            200,
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
            },
          ));

      // act
      final result = await coinRemoteDataSourceImpl.searchTrending();

      // assert
      expect(result, isA<TrendingResponseDTO>());
    });

    test('should throw server exception when response code is not 200-299',
        () async {
      // arrange
      var url = Uri.parse(Urls.SEARCH_TRENDING);

      when(mockHttpClient.get(url)).thenAnswer((_) async => http.Response(
            'Not found',
            404,
            headers: {
              HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
            },
          ));

      // act && assert
      expect(() async {
        await coinRemoteDataSourceImpl.searchTrending();
      }, throwsA(isA<ServerException>()));
    });
  });
}
