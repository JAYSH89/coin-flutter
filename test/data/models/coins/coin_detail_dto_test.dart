import 'dart:convert';

import 'package:coin_flutter/data/models/coins/coin_detail_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/json_reader.dart';

void main() {
  CoinDetailDTO testCoinDetail = CoinDetailDTO(
    id: "bitcoin",
    symbol: "btc",
    name: "Bitcoin",
    webSlug: "bitcoin",
    description: "description",
    thumbImage:
        "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1696501400",
    smallImage:
        "https://assets.coingecko.com/coins/images/1/small/bitcoin.png?1696501400",
    largeImage:
        "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
    marketCapRank: 1,
    currentPrice: const CoinDetailCurrentPriceDTO(
      eur: 36674,
      usd: 39830,
    ),
    lastUpdated: DateTime.parse("2024-01-24T00:29:50.869Z"),
  );

  Map<String, dynamic> expectedJson = {
    "id": "bitcoin",
    "symbol": "btc",
    "name": "Bitcoin",
    "web_slug": "bitcoin",
    "description": {
      "en": "description",
    },
    "image": {
      "thumb":
          "https://assets.coingecko.com/coins/images/1/thumb/bitcoin.png?1696501400",
      "small":
          "https://assets.coingecko.com/coins/images/1/small/bitcoin.png?1696501400",
      "large":
          "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
    },
    "market_cap_rank": 1,
    "market_data": {
      "current_price": {
        "eur": 36674,
        "usd": 39830,
      }
    },
    "last_updated": "2024-01-24T00:29:50.869Z",
  };

  test('coin detail from json should serialize successful', () {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(
      readJson('helpers/dummy_data/dummy_coins_id.json'),
    );

    // act
    final result = CoinDetailDTO.fromJson(jsonMap);

    // assert
    expect(result, equals(testCoinDetail));
  });

  test('coin detail should return a json map successful', () {
    // arrange
    final result = testCoinDetail.toJson();

    // assert
    expect(result, equals(expectedJson));
  });
}
