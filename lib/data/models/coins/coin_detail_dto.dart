import 'package:coin_flutter/domain/models/coins/coin_detail.dart';
import 'package:equatable/equatable.dart';

class CoinDetailDTO extends Equatable {
  final String id;
  final String symbol;
  final String name;
  final String webSlug;
  final String description;
  final String thumbImage;
  final String smallImage;
  final String largeImage;
  final num marketCapRank;
  final CoinDetailCurrentPriceDTO currentPrice;
  final DateTime lastUpdated;

  const CoinDetailDTO({
    required this.id,
    required this.symbol,
    required this.name,
    required this.webSlug,
    required this.description,
    required this.thumbImage,
    required this.smallImage,
    required this.largeImage,
    required this.marketCapRank,
    required this.currentPrice,
    required this.lastUpdated,
  });

  factory CoinDetailDTO.fromJson(Map<String, dynamic> json) => CoinDetailDTO(
        id: json['id'],
        symbol: json['symbol'],
        name: json['name'],
        webSlug: json['web_slug'],
        description: json['description']['en'],
        thumbImage: json['image']['thumb'],
        smallImage: json['image']['small'],
        largeImage: json['image']['large'],
        marketCapRank: json['market_cap_rank'],
        currentPrice: CoinDetailCurrentPriceDTO.fromJson(json['market_data']),
        lastUpdated: DateTime.parse(json['last_updated']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'symbol': symbol,
        'name': name,
        'web_slug': webSlug,
        'description': {
          'en': description,
        },
        'image': {
          'thumb': thumbImage,
          'small': smallImage,
          'large': largeImage,
        },
        'market_cap_rank': marketCapRank,
        'market_data': currentPrice.toJson(),
        'last_updated': lastUpdated.toIso8601String(),
      };

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

extension CoinDetailDTOMapper on CoinDetailDTO {
  CoinDetail toCoinDetail() => CoinDetail(
        id: id,
        symbol: symbol,
        name: name,
        webSlug: webSlug,
        description: description,
        thumbImage: thumbImage,
        smallImage: smallImage,
        largeImage: largeImage,
        marketCapRank: marketCapRank.toInt(),
        lastUpdated: lastUpdated,
      );
}

class CoinDetailCurrentPriceDTO extends Equatable {
  final num eur;
  final num usd;

  const CoinDetailCurrentPriceDTO({required this.eur, required this.usd});

  factory CoinDetailCurrentPriceDTO.fromJson(Map<String, dynamic> json) {
    return CoinDetailCurrentPriceDTO(
      eur: json['current_price']['eur'],
      usd: json['current_price']['usd'],
    );
  }

  Map<String, dynamic> toJson() => {
        'current_price': {
          'eur': eur,
          'usd': usd,
        }
      };

  @override
  List<Object?> get props => [eur, usd];
}

extension CoinDetailCurrentPriceDTOMapper on CoinDetailCurrentPriceDTO {
  CoinDetailCurrentPrice toCoinDetailCurrentPrice() => CoinDetailCurrentPrice(
        eur: eur.toDouble(),
        usd: usd.toDouble(),
      );
}
