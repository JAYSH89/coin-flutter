import 'package:coin_flutter/data/models/trending/trending_categories_dto.dart';
import 'package:coin_flutter/data/models/trending/trending_coin_dto.dart';
import 'package:coin_flutter/data/models/trending/trending_nfts_dto.dart';
import 'package:coin_flutter/domain/models/trending/trending.dart';
import 'package:equatable/equatable.dart';

class TrendingResponseDTO extends Equatable {
  final List<TrendingCoinDTO> coins;
  final List<TrendingNftsDTO> nfts;
  final List<TrendingCategoriesDTO> categories;

  const TrendingResponseDTO({
    required this.coins,
    required this.nfts,
    required this.categories,
  });

  factory TrendingResponseDTO.fromJson(Map<String, dynamic> json) {
    final List<dynamic> trendingCoins = json['coins'];
    final List<TrendingCoinDTO> coins = trendingCoins
        .map((element) => TrendingCoinDTO.fromJson(element['item']))
        .toList();

    final List<dynamic> trendingNfts = json['nfts'];
    List<TrendingNftsDTO> nfts = trendingNfts
        .map<TrendingNftsDTO>((jsonItem) => TrendingNftsDTO.fromJson(jsonItem))
        .toList();

    final List<dynamic> trendingCategories = json['categories'];
    final List<TrendingCategoriesDTO> categories = trendingCategories
        .map<TrendingCategoriesDTO>(
            (jsonItem) => TrendingCategoriesDTO.fromJson(jsonItem))
        .toList();

    return TrendingResponseDTO(
      coins: coins,
      nfts: nfts,
      categories: categories,
    );
  }

  Map<String, dynamic> toJson() => {
        'coins': coins.map((element) => element.toJson()),
        'nfts': nfts.map((element) => element.toJson()),
        'categories': categories.map((element) => element.toJson()),
      };

  @override
  List<Object?> get props => [
        coins,
        nfts,
        categories,
      ];
}

extension TrendingResponseMapper on TrendingResponseDTO {
  Trending toTrending() => Trending(
        coins: coins.map((e) => e.toTrendingCoin()).toList(),
        nfts: nfts.map((e) => e.toTrendingNfts()).toList(),
        categories: categories.map((e) => e.toTrendingCategories()).toList(),
      );
}
