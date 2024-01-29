import 'dart:convert';

import 'package:coin_flutter/data/models/coins/coin_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/json_reader.dart';

void main() {
  const testJson = {
    "id": "matic-network",
    "symbol": "matic",
    "name": "Polygon",
    "image": "https://assets.coingecko.com/coins/images/4713/large/polygon.png?1698233745",
    "current_price": 0.664677,
    "market_cap": 6164827383,
    "market_cap_rank": 16,
    "fully_diluted_valuation": 6641026458,
    "total_volume": 461417947,
    "high_24h": 0.699684,
    "low_24h": 0.637416,
    "price_change_24h": -0.02392907015006951,
    "price_change_percentage_24h": -3.475,
    "market_cap_change_24h": -238942824.5154562,
    "market_cap_change_percentage_24h": -3.73128,
    "circulating_supply": 9282943566.203985,
    "total_supply": 10000000000,
    "max_supply": 10000000000,
    "ath": 2.58,
    "ath_change_percentage": -74.24543,
    "ath_date": "2021-12-27T02:08:34.307Z",
    "atl": 0.00280202,
    "atl_change_percentage": 23584.9881,
    "atl_date": "2019-05-10T00:00:00.000Z",
    "roi": {
      "times": 273.4763468432398,
      "currency": "usd",
      "percentage": 27347.63468432398
    },
    "last_updated": "2024-01-24T00:28:52.794Z"
  };

  const CoinRoiDTO testCoinRoi = CoinRoiDTO(
    times: 273.4763468432398,
    currency: 'usd',
    percentage: 27347.63468432398,
  );

  CoinDTO testCoin = CoinDTO(
    id: "matic-network",
    symbol: "matic",
    name: "Polygon",
    image: "https://assets.coingecko.com/coins/images/4713/large/polygon.png?1698233745",
    currentPrice: 0.664677,
    marketCap: 6164827383,
    marketCapRank: 16,
    fullyDilutedValuation: 6641026458,
    totalVolume: 461417947,
    high24h: 0.699684,
    low24h: 0.637416,
    priceChange24h: -0.02392907015006951,
    priceChangePercentage24h: -3.475,
    marketCapChange24h: -238942824.5154562,
    marketCapChangePercentage24h: -3.73128,
    circulatingSupply: 9282943566.203985,
    totalSupply: 10000000000,
    maxSupply: 10000000000,
    ath: 2.58,
    athChangePercentage: -74.24543,
    athDate: DateTime.parse("2021-12-27T02:08:34.307Z"),
    atl: 0.00280202,
    atlChangePercentage: 23584.9881,
    atlDate: DateTime.parse("2019-05-10T00:00:00.000Z"),
    roi: testCoinRoi,
    lastUpdated: DateTime.parse("2024-01-24T00:28:52.794Z"),
  );

  test('should return a valid model from json', () {
    // arrange
    final List<dynamic> jsonMap = json.decode(
      readJson('helpers/dummy_data/dummy_coins_markets.json'),
    );

    // act
    Map<String, dynamic> first = jsonMap.first;
    final result = CoinDTO.fromMap(first);

    // assert
    expect(result, equals(testCoin));
  });

  test('should return a json map containing correct data', () {
    // arrange
    final result = testCoin.toMap();

    // act + assert
    expect(result, equals(testJson));
  });
}
