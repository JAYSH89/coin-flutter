import 'dart:convert';

import 'package:coin_flutter/data/models/trending/trending_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/json_reader.dart';

void main() {
  test('should return a valid model from json', () {
    // arrange
    final Map<String, dynamic> jsonMap = json.decode(
      readJson('helpers/dummy_data/dummy_trending.json'),
    );

    // act
    final result = TrendingResponseDTO.fromJson(jsonMap);

    // assert
    expect(result.coins.first.id, 'manta-network');
    expect(result.nfts.first.id, 'trump-digital-trading-cards');
    expect(result.nfts.length, 7);
    expect(result.categories.first.id, 72);
  });
}
