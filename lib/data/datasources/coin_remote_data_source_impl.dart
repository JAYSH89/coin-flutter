import 'dart:convert';

import 'package:coin_flutter/core/constants/constants.dart';
import 'package:coin_flutter/core/errors/server_exception.dart';
import 'package:coin_flutter/data/models/coins/coin_detail_dto.dart';
import 'package:coin_flutter/data/models/coins/coin_dto.dart';
import 'package:coin_flutter/data/models/trending/trending_response_dto.dart';
import 'package:http/http.dart' as http;

import 'coin_remote_data_source.dart';

class CoinRemoteDataSourceImpl implements CoinRemoteDataSource {
  final http.Client client;

  CoinRemoteDataSourceImpl({required this.client});

  @override
  Future<TrendingResponseDTO> getTrendingCoins() async {
    var url = Uri.parse(Urls.SEARCH_TRENDING);
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final result = TrendingResponseDTO.fromJson(responseBody);
      return result;
    }

    throw ServerException();
  }

  @override
  Future<List<CoinDTO>> getAllCoins() async {
    final url = Uri.parse(Urls.COINS_ALL).replace(queryParameters: {
      'currency': 'eur',
    });
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> responseBody = json.decode(response.body);
      final List<Map<String, dynamic>> result = responseBody.map((coinJson) {
        return coinJson as Map<String, dynamic>;
      }).toList();

      return result.map((dto) => CoinDTO.fromJson(dto)).toList();
    }

    throw ServerException();
  }

  @override
  Future<CoinDetailDTO> getCoin(String id) async {
    final baseUrl = Uri.parse(Urls.COINS_DETAIL);
    final Iterable<String> path = List.from(baseUrl.pathSegments)..add(id);
    final url = baseUrl.replace(pathSegments: path);

    final response = await client.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      return CoinDetailDTO.fromJson(responseBody);
    }

    throw ServerException();
  }
}
