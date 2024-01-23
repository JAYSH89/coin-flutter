import 'package:equatable/equatable.dart';

class TrendingNfts extends Equatable {
  final String id;
  final String name;
  final String symbol;
  final String thumb;
  final int nftContractId;
  final String nativeCurrencySymbol;
  final double floorPriceInNativeCurrency;
  final double floorPrice24hPercentageChange;
  final TrendingNftsData data;

  const TrendingNfts({
    required this.id,
    required this.name,
    required this.symbol,
    required this.thumb,
    required this.nftContractId,
    required this.nativeCurrencySymbol,
    required this.floorPriceInNativeCurrency,
    required this.floorPrice24hPercentageChange,
    required this.data,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        symbol,
        thumb,
        nftContractId,
        nativeCurrencySymbol,
        floorPriceInNativeCurrency,
        floorPrice24hPercentageChange,
        data,
      ];
}

class TrendingNftsData extends Equatable {
  const TrendingNftsData({
    required this.floorPrice,
    required this.floorPriceInUsd24hPercentageChange,
    required this.h24Volume,
    required this.h24AverageSalePrice,
    required this.sparkline,
    this.content,
  });

  final String floorPrice;
  final String floorPriceInUsd24hPercentageChange;
  final String h24Volume;
  final String h24AverageSalePrice;
  final String sparkline;
  final Map<String, dynamic>? content;

  @override
  List<Object?> get props => [
        floorPrice,
        floorPriceInUsd24hPercentageChange,
        h24Volume,
        h24AverageSalePrice,
        sparkline,
        content,
      ];
}
