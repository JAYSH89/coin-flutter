import 'package:equatable/equatable.dart';

class TrendingCoin extends Equatable {
  final String id;
  final int coinId;
  final String name;
  final String symbol;
  final int marketCapRank;
  final String thumbUrl;
  final String smallUrl;
  final String largeUrl;
  final String slug;

  const TrendingCoin({
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
