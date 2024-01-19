import 'dart:convert';

import 'package:coin_flutter/data/models/trending/trending_categories_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/json_reader.dart';

void main() {
  const TrendingCategoriesDataDTO testTrendingCategoriesData =
      TrendingCategoriesDataDTO(
    marketCap: 1209737155.8610616,
    marketCapBtc: 28337.240568908564,
    totalVolume: 48752105.46501088,
    totalVolumeBtc: 1141.9837227529783,
    marketCapChangePercentage24h: {
      "aed": 4.260227265723937,
      "ars": 4.316286443310593,
      "aud": 5.816887966226711,
      "bch": 5.768522264871638,
      "bdt": 4.511949015466327,
      "bhd": 4.27102898066615,
      "bmd": 4.26079499582812,
      "bnb": 7.234072093556815,
      "brl": 5.604870627329109,
      "btc": 3.8375968860445893,
      "cad": 4.874029887989016,
      "chf": 4.983980700138569,
      "clp": 5.831900926203701,
      "cny": 5.05881776787574,
      "czk": 5.130640579552897,
      "dkk": 4.898546907110424,
      "dot": 5.90056169326008,
      "eos": 7.344901810310511,
      "eth": 3.049341496879389,
      "eur": 4.908754657644223,
      "gbp": 4.618628014258607,
      "gel": 4.2607949958285785,
      "hkd": 4.2617945707451845,
      "huf": 5.089045705797698,
      "idr": 4.851914188774948,
      "ils": 5.2628244348829,
      "inr": 4.550289937766208,
      "jpy": 5.648497963994911,
      "krw": 6.167853790277901,
      "kwd": 4.403948865344806,
      "lkr": 4.297582525922525,
      "ltc": 4.425993033700991,
      "mmk": 4.509456807017128,
      "mxn": 6.504014514863172,
      "myr": 5.332541041400246,
      "ngn": -0.7537699026812011,
      "nok": 5.437506675030936,
      "nzd": 5.405403178343405,
      "php": 4.524462327805835,
      "pkr": 4.511421088657981,
      "pln": 5.267325024920527,
      "rub": 5.09045703043012,
      "sar": 4.271832503191632,
      "sek": 5.502876755291829,
      "sgd": 5.036139621250222,
      "thb": 5.851845743261916,
      "try": 4.378150391285292,
      "twd": 5.498439095175089,
      "uah": 4.460590617459267,
      "usd": 4.26079499582812,
      "vef": 4.260794995828187,
      "vnd": 4.516649833348552,
      "xag": 6.227550278888764,
      "xau": 5.764216684858313,
      "xdr": 4.519047134876686,
      "xlm": 4.716196660326973,
      "xrp": 5.055229188964422,
      "yfi": 4.104002234408996,
      "zar": 6.162284773985234,
      "bits": 3.837596886044597,
      "link": 0.6927571300745766,
      "sats": 3.8375968860445857,
    },
    sparkline: "https://www.coingecko.com/categories/22364040/sparkline.svg",
  );

  const TrendingCategoriesDTO testTrendingCategories = TrendingCategoriesDTO(
    id: 267,
    name: "Account Abstraction",
    marketCap1hChange: -0.14274172842127414,
    slug: 'account-abstraction',
    coinsCount: 10,
    data: testTrendingCategoriesData,
  );

  test('should return a valid model from json', () {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(
      readJson('helpers/dummy_data/dummy_trending_categories.json'),
    );

    // act
    final result = TrendingCategoriesDTO.fromJson(jsonMap);

    // assert
    expect(result, equals(testTrendingCategories));
  });

  test('should return a json map containing correct data', () {
    // arrange
    final result = testTrendingCategories.toJson();

    // act
    final expectedJsonMap = {
      "id": 267,
      "name": "Account Abstraction",
      "market_cap_1h_change": -0.14274172842127414,
      "slug": "account-abstraction",
      "coins_count": 10,
      "data": {
        "market_cap": 1209737155.8610616,
        "market_cap_btc": 28337.240568908564,
        "total_volume": 48752105.46501088,
        "total_volume_btc": 1141.9837227529783,
        "market_cap_change_percentage_24h": {
          "aed": 4.260227265723937,
          "ars": 4.316286443310593,
          "aud": 5.816887966226711,
          "bch": 5.768522264871638,
          "bdt": 4.511949015466327,
          "bhd": 4.27102898066615,
          "bmd": 4.26079499582812,
          "bnb": 7.234072093556815,
          "brl": 5.604870627329109,
          "btc": 3.8375968860445893,
          "cad": 4.874029887989016,
          "chf": 4.983980700138569,
          "clp": 5.831900926203701,
          "cny": 5.05881776787574,
          "czk": 5.130640579552897,
          "dkk": 4.898546907110424,
          "dot": 5.90056169326008,
          "eos": 7.344901810310511,
          "eth": 3.049341496879389,
          "eur": 4.908754657644223,
          "gbp": 4.618628014258607,
          "gel": 4.2607949958285785,
          "hkd": 4.2617945707451845,
          "huf": 5.089045705797698,
          "idr": 4.851914188774948,
          "ils": 5.2628244348829,
          "inr": 4.550289937766208,
          "jpy": 5.648497963994911,
          "krw": 6.167853790277901,
          "kwd": 4.403948865344806,
          "lkr": 4.297582525922525,
          "ltc": 4.425993033700991,
          "mmk": 4.509456807017128,
          "mxn": 6.504014514863172,
          "myr": 5.332541041400246,
          "ngn": -0.7537699026812011,
          "nok": 5.437506675030936,
          "nzd": 5.405403178343405,
          "php": 4.524462327805835,
          "pkr": 4.511421088657981,
          "pln": 5.267325024920527,
          "rub": 5.09045703043012,
          "sar": 4.271832503191632,
          "sek": 5.502876755291829,
          "sgd": 5.036139621250222,
          "thb": 5.851845743261916,
          "try": 4.378150391285292,
          "twd": 5.498439095175089,
          "uah": 4.460590617459267,
          "usd": 4.26079499582812,
          "vef": 4.260794995828187,
          "vnd": 4.516649833348552,
          "xag": 6.227550278888764,
          "xau": 5.764216684858313,
          "xdr": 4.519047134876686,
          "xlm": 4.716196660326973,
          "xrp": 5.055229188964422,
          "yfi": 4.104002234408996,
          "zar": 6.162284773985234,
          "bits": 3.837596886044597,
          "link": 0.6927571300745766,
          "sats": 3.8375968860445857
        },
        "sparkline": "https://www.coingecko.com/categories/22364040/sparkline.svg"
      }
    };

    // assert
    expect(result, equals(expectedJsonMap));
  });
}
