import 'dart:convert';

import 'package:coin_flutter/data/models/trending/trending_coin_dto.dart';
import 'package:test/test.dart';

import '../../helpers/json_reader.dart';

void main() {
  const TrendingCoinDTO testTrendingDTO = TrendingCoinDTO(
    id: "biconomy",
    coinId: 21061,
    name: "Biconomy",
    symbol: "BICO",
    marketCapRank: 203,
    thumbUrl:
        "https://assets.coingecko.com/coins/images/21061/thumb/biconomy_logo.jpg?1696520444",
    smallUrl:
        "https://assets.coingecko.com/coins/images/21061/small/biconomy_logo.jpg?1696520444",
    largeUrl:
        "https://assets.coingecko.com/coins/images/21061/large/biconomy_logo.jpg?1696520444",
    slug: "biconomy",
  );

  test('should return a valid model from json', () {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(
      readJson('helpers/dummy_data/dummy_trending_coin.json'),
    );

    // act
    final result = TrendingCoinDTO.fromJson(jsonMap);

    // assert
    expect(result, equals(testTrendingDTO));
  });

  test('should return a json map containing correct data', () {
    // act
    final result = testTrendingDTO.toJson();

    // assert
    final expectedJsonMap = {
      "id": "biconomy",
      "coin_id": 21061,
      "name": "Biconomy",
      "symbol": "BICO",
      "market_cap_rank": 203,
      "thumb": "https://assets.coingecko.com/coins/images/21061/thumb/biconomy_logo.jpg?1696520444",
      "small": "https://assets.coingecko.com/coins/images/21061/small/biconomy_logo.jpg?1696520444",
      "large": "https://assets.coingecko.com/coins/images/21061/large/biconomy_logo.jpg?1696520444",
      "slug": "biconomy",
    };

    expect(result, equals(expectedJsonMap));
  });
}
