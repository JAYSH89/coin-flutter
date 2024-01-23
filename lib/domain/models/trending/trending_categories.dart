import 'package:equatable/equatable.dart';

class TrendingCategories extends Equatable {
  final int id;
  final String name;
  final double marketCap1hChange;
  final String slug;
  final int coinsCount;
  final TrendingCategoriesData data;

  const TrendingCategories({
    required this.id,
    required this.name,
    required this.marketCap1hChange,
    required this.slug,
    required this.coinsCount,
    required this.data,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        marketCap1hChange,
        slug,
        coinsCount,
        data,
      ];
}

class TrendingCategoriesData extends Equatable {
  const TrendingCategoriesData({
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
