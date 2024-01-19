import 'dart:convert';

import 'package:coin_flutter/core/constants/constants.dart';
import 'package:coin_flutter/core/errors/server_exception.dart';
import 'package:coin_flutter/data/models/trending/trending_response_dto.dart';
import 'package:http/http.dart' as http;

import 'coin_remote_data_source.dart';

class CoinRemoteDataSourceImpl implements CoinRemoteDataSource {
  final http.Client client;

  CoinRemoteDataSourceImpl({required this.client});

  @override
  Future<TrendingResponseDTO> searchTrending() async {
    var url = Uri.parse(Urls.SEARCH_TRENDING);
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final result = TrendingResponseDTO.fromJson(responseBody);
      return result;
    }

    throw ServerException();
  }
}