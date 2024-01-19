import 'package:coin_flutter/data/models/trending/trending_coin_dto.dart';
import 'package:equatable/equatable.dart';

class TrendingCategoriesDTO extends Equatable {
  const TrendingCategoriesDTO({
    required this.id,
    required this.name,
    required this.marketCap1hChange,
    required this.slug,
    required this.coinsCount,
    required this.data,
  });

  final int id;
  final String name;
  final double marketCap1hChange;
  final String slug;
  final int coinsCount;
  final TrendingCategoriesDataDTO data;

  factory TrendingCategoriesDTO.fromJson(Map<String, dynamic> json) {
    return TrendingCategoriesDTO(
      id: json['id'],
      name: json['name'],
      marketCap1hChange: json['market_cap_1h_change'],
      slug: json['slug'],
      coinsCount: json['coins_count'],
      data: TrendingCategoriesDataDTO.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'market_cap_1h_change': marketCap1hChange,
      'slug': slug,
      'coins_count': coinsCount,
      'data': data.toJson(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        marketCap1hChange,
        slug,
        coinsCount,
        data.toJson(),
      ];
}

class TrendingCategoriesDataDTO extends Equatable {
  const TrendingCategoriesDataDTO({
    required this.marketCap,
    required this.marketCapBtc,
    required this.totalVolume,
    required this.totalVolumeBtc,
    required this.marketCapChangePercentage24h,
    required this.sparkline,
  });

  final double marketCap;
  final double marketCapBtc;
  final double totalVolume;
  final double totalVolumeBtc;
  final Map<String, dynamic> marketCapChangePercentage24h;
  final String sparkline;

  factory TrendingCategoriesDataDTO.fromJson(Map<String, dynamic> json) {
    return TrendingCategoriesDataDTO(
      marketCap: json['market_cap'],
      marketCapBtc: json['market_cap_btc'],
      totalVolume: json['total_volume'],
      totalVolumeBtc: json['total_volume_btc'],
      marketCapChangePercentage24h: json['market_cap_change_percentage_24h'],
      sparkline: json['sparkline'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'market_cap': marketCap,
      'market_cap_btc': marketCapBtc,
      'total_volume': totalVolume,
      'total_volume_btc': totalVolumeBtc,
      'market_cap_change_percentage_24h': marketCapChangePercentage24h,
      'sparkline': sparkline,
    };
  }

  @override
  List<Object?> get props => [
        marketCap,
        marketCapBtc,
        totalVolume,
        totalVolumeBtc,
        marketCapChangePercentage24h,
        sparkline,
      ];
}
