import 'package:coin_flutter/domain/models/trending/trending_coin.dart';
import 'package:equatable/equatable.dart';

class TrendingCoinDTO extends Equatable {
  final String id;
  final num coinId;
  final String name;
  final String symbol;
  final num marketCapRank;
  final String thumbUrl;
  final String smallUrl;
  final String largeUrl;
  final String slug;

  const TrendingCoinDTO({
    required this.id,
    required this.coinId,
    required this.name,
    required this.symbol,
    required this.marketCapRank,
    required this.thumbUrl,
    required this.smallUrl,
    required this.largeUrl,
    required this.slug,
  });

  factory TrendingCoinDTO.fromJson(Map<String, dynamic> json) {
    return TrendingCoinDTO(
      id: json["id"],
      coinId: json["coin_id"],
      name: json["name"],
      symbol: json["symbol"],
      marketCapRank: json["market_cap_rank"],
      thumbUrl: json["thumb"],
      smallUrl: json["small"],
      largeUrl: json["large"],
      slug: json["slug"],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'coin_id': coinId,
        'name': name,
        'symbol': symbol,
        'market_cap_rank': marketCapRank,
        'thumb': thumbUrl,
        'small': smallUrl,
        'large': largeUrl,
        'slug': slug,
      };

  @override
  List<Object?> get props => [
        id,
        coinId,
        name,
        symbol,
        marketCapRank,
        thumbUrl,
        smallUrl,
        largeUrl,
        slug,
      ];
}

extension TrendingCoinMapper on TrendingCoinDTO {
  TrendingCoin toTrendingCoin() => TrendingCoin(
        id: id,
        coinId: coinId.toInt(),
        name: name,
        symbol: symbol,
        marketCapRank: marketCapRank.toInt(),
        thumbUrl: thumbUrl,
        smallUrl: smallUrl,
        largeUrl: largeUrl,
        slug: slug,
      );
}
