import 'package:equatable/equatable.dart';
import 'package:coin_flutter/domain/models/trending/trending_coin.dart';
import 'package:coin_flutter/domain/models/trending/trending_categories.dart';
import 'package:coin_flutter/domain/models/trending/trending_nfts.dart';

class Trending extends Equatable {
  final List<TrendingCoin> coins;
  final List<TrendingNfts> nfts;
  final List<TrendingCategories> categories;

  const Trending({
    required this.coins,
    required this.nfts,
    required this.categories,
  });

  @override
  List<Object?> get props => [
        coins,
        nfts,
        categories,
      ];
}
