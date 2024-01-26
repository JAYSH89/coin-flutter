import 'package:equatable/equatable.dart';

class CoinDetail extends Equatable {
  final String id;
  final String symbol;
  final String name;
  final String webSlug;
  final String description;
  final String thumbImage;
  final String smallImage;
  final String largeImage;
  final int marketCapRank;
  final DateTime lastUpdated;

  const CoinDetail({
    required this.id,
    required this.symbol,
    required this.name,
    required this.webSlug,
    required this.description,
    required this.thumbImage,
    required this.smallImage,
    required this.largeImage,
    required this.marketCapRank,
    required this.lastUpdated,
  });

  @override
  List<Object?> get props => [
        id,
        symbol,
        name,
        webSlug,
        description,
        thumbImage,
        smallImage,
        largeImage,
        marketCapRank,
        lastUpdated,
      ];
}

class CoinDetailCurrentPrice extends Equatable {
  final double eur;
  final double usd;

  const CoinDetailCurrentPrice({required this.eur, required this.usd});

  @override
  List<Object?> get props => [eur, usd];
}
