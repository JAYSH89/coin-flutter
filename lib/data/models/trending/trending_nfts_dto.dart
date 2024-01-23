import 'package:coin_flutter/domain/models/trending/trending_nfts.dart';
import 'package:equatable/equatable.dart';

class TrendingNftsDTO extends Equatable {
  final String id;
  final String name;
  final String thumb;
  final String symbol;
  final int nftContractId;
  final String nativeCurrencySymbol;
  final double floorPriceInNativeCurrency;
  final double floorPrice24hPercentageChange;
  final TrendingNftsDataDTO data;

  const TrendingNftsDTO({
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

  factory TrendingNftsDTO.fromJson(Map<String, dynamic> json) {
    return TrendingNftsDTO(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      thumb: json['thumb'],
      nftContractId: json['nft_contract_id'],
      nativeCurrencySymbol: json['native_currency_symbol'],
      floorPriceInNativeCurrency:
          (json['floor_price_in_native_currency'] as num).toDouble(),
      floorPrice24hPercentageChange:
          (json['floor_price_24h_percentage_change'] as num).toDouble(),
      data: TrendingNftsDataDTO.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'symbol': symbol,
      'thumb': thumb,
      'nft_contract_id': nftContractId,
      'native_currency_symbol': nativeCurrencySymbol,
      'floor_price_in_native_currency': floorPriceInNativeCurrency,
      'floor_price_24h_percentage_change': floorPrice24hPercentageChange,
      'data': data.toJson(),
    };
  }

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
      ];
}

extension TrendingNftsMapper on TrendingNftsDTO {
  TrendingNfts toTrendingNfts() => TrendingNfts(
        id: id,
        name: name,
        symbol: symbol,
        thumb: thumb,
        nftContractId: nftContractId,
        nativeCurrencySymbol: nativeCurrencySymbol,
        floorPriceInNativeCurrency: floorPriceInNativeCurrency,
        floorPrice24hPercentageChange: floorPrice24hPercentageChange,
        data: data.toTrendingNftsData(),
      );
}

class TrendingNftsDataDTO extends Equatable {
  const TrendingNftsDataDTO({
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

  factory TrendingNftsDataDTO.fromJson(Map<String, dynamic> json) {
    return TrendingNftsDataDTO(
      floorPrice: json['floor_price'],
      floorPriceInUsd24hPercentageChange:
          json['floor_price_in_usd_24h_percentage_change'],
      h24Volume: json['h24_volume'],
      h24AverageSalePrice: json['h24_average_sale_price'],
      sparkline: json['sparkline'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "floor_price": floorPrice,
      "floor_price_in_usd_24h_percentage_change":
          floorPriceInUsd24hPercentageChange,
      "h24_volume": h24Volume,
      "h24_average_sale_price": h24AverageSalePrice,
      "sparkline": sparkline,
      "content": content,
    };
  }

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

extension TrendingNftsDataMapper on TrendingNftsDataDTO {
  TrendingNftsData toTrendingNftsData() => TrendingNftsData(
        floorPrice: floorPrice,
        floorPriceInUsd24hPercentageChange: floorPriceInUsd24hPercentageChange,
        h24Volume: h24Volume,
        h24AverageSalePrice: h24AverageSalePrice,
        sparkline: sparkline,
      );
}
