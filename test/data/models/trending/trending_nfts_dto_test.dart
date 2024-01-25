import 'dart:convert';

import 'package:coin_flutter/data/models/trending/trending_nfts_dto.dart';
import 'package:test/test.dart';

import '../../../helpers/json_reader.dart';

void main() {
  const TrendingNftsDataDTO testTrendingNftsData = TrendingNftsDataDTO(
    floorPrice: "100.00 ETH",
    floorPriceInUsd24hPercentageChange: "903.460574078169",
    h24Volume: "9.11 ETH",
    h24AverageSalePrice: "9.11 ETH",
    sparkline: "https://www.coingecko.com/nft/3604/sparkline.svg",
    content: null,
  );

  const TrendingNftsDTO testTrendingNfts = TrendingNftsDTO(
    id: "gen1-pass-holders",
    name: "GEN1 Pass Holders",
    symbol: "GEN1PASS",
    thumb:
        "https://assets.coingecko.com/nft_contracts/images/3604/small/gen1.png?1699593195",
    nftContractId: 3604,
    nativeCurrencySymbol: "eth",
    floorPriceInNativeCurrency: 100.0,
    floorPrice24hPercentageChange: 903.460574078169,
    data: testTrendingNftsData,
  );

  test('should return a valid model from json', () {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(
      readJson('helpers/dummy_data/dummy_trending_nfts.json'),
    );

    // act
    final result = TrendingNftsDTO.fromJson(jsonMap);

    // assert
    expect(result, equals(testTrendingNfts));
  });

  test('should return a json map containing correct data', () {
    // arrange
    final result = testTrendingNfts.toJson();

    // act
    final expectedJsonMap = {
      "id": "gen1-pass-holders",
      "name": "GEN1 Pass Holders",
      "symbol": "GEN1PASS",
      "thumb":
          "https://assets.coingecko.com/nft_contracts/images/3604/small/gen1.png?1699593195",
      "nft_contract_id": 3604,
      "native_currency_symbol": "eth",
      "floor_price_in_native_currency": 100.0,
      "floor_price_24h_percentage_change": 903.460574078169,
      "data": {
        "floor_price": "100.00 ETH",
        "floor_price_in_usd_24h_percentage_change": "903.460574078169",
        "h24_volume": "9.11 ETH",
        "h24_average_sale_price": "9.11 ETH",
        "sparkline": "https://www.coingecko.com/nft/3604/sparkline.svg",
        "content": null
      }
    };

    // assert
    expect(result, equals(expectedJsonMap));
  });
}
