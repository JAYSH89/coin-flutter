import 'package:coin_flutter/domain/models/coins/coin.dart';
import 'package:equatable/equatable.dart';

class CoinDTO extends Equatable {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final num currentPrice;
  final num marketCap;
  final num marketCapRank;
  final num fullyDilutedValuation;
  final num totalVolume;
  final num high24h;
  final num low24h;
  final num priceChange24h;
  final num priceChangePercentage24h;
  final num marketCapChange24h;
  final num marketCapChangePercentage24h;
  final num circulatingSupply;
  final num totalSupply;
  final num? maxSupply;
  final num ath;
  final num athChangePercentage;
  final DateTime athDate;
  final num atl;
  final num atlChangePercentage;
  final DateTime atlDate;
  final CoinRoiDTO? roi;
  final DateTime lastUpdated;

  const CoinDTO({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    required this.fullyDilutedValuation,
    required this.totalVolume,
    required this.high24h,
    required this.low24h,
    required this.priceChange24h,
    required this.priceChangePercentage24h,
    required this.marketCapChange24h,
    required this.marketCapChangePercentage24h,
    required this.circulatingSupply,
    required this.totalSupply,
    this.maxSupply,
    required this.ath,
    required this.athChangePercentage,
    required this.athDate,
    required this.atl,
    required this.atlChangePercentage,
    required this.atlDate,
    this.roi,
    required this.lastUpdated,
  });

  factory CoinDTO.fromJson(Map<String, dynamic> json) => CoinDTO(
        id: json['id'],
        symbol: json['symbol'],
        name: json['name'],
        image: json['image'],
        currentPrice: json['current_price'],
        marketCap: json['market_cap'],
        marketCapRank: json['market_cap_rank'],
        fullyDilutedValuation: json['fully_diluted_valuation'],
        totalVolume: json['total_volume'],
        high24h: json['high_24h'],
        low24h: json['low_24h'],
        priceChange24h: json['price_change_24h'],
        priceChangePercentage24h: json['price_change_percentage_24h'],
        marketCapChange24h: json['market_cap_change_24h'],
        marketCapChangePercentage24h: json['market_cap_change_percentage_24h'],
        circulatingSupply: json['circulating_supply'],
        totalSupply: json['total_supply'],
        maxSupply: json['max_supply'],
        ath: json['ath'],
        athChangePercentage: json['ath_change_percentage'],
        athDate: DateTime.parse(json['ath_date']),
        atl: json['atl'],
        atlChangePercentage: json['atl_change_percentage'],
        atlDate: DateTime.parse(json['atl_date']),
        roi: CoinRoiDTO.fromJson(json['roi']),
        lastUpdated: DateTime.parse(json['last_updated']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'symbol': symbol,
        'name': name,
        'image': image,
        'current_price': currentPrice,
        'market_cap': marketCap,
        'market_cap_rank': marketCapRank,
        'fully_diluted_valuation': fullyDilutedValuation,
        'total_volume': totalVolume,
        'high_24h': high24h,
        'low_24h': low24h,
        'price_change_24h': priceChange24h,
        'price_change_percentage_24h': priceChangePercentage24h,
        'market_cap_change_24h': marketCapChange24h,
        'market_cap_change_percentage_24h': marketCapChangePercentage24h,
        'circulating_supply': circulatingSupply,
        'total_supply': totalSupply,
        'max_supply': maxSupply,
        'ath': ath,
        'ath_change_percentage': athChangePercentage,
        'ath_date': athDate.toIso8601String(),
        'atl': atl,
        'atl_change_percentage': atlChangePercentage,
        'atl_date': atlDate.toIso8601String(),
        'roi': roi?.toJson(),
        'last_updated': lastUpdated.toIso8601String(),
      };

  @override
  List<Object?> get props => [
        id,
        symbol,
        name,
        image,
        currentPrice,
        marketCap,
        marketCapRank,
        fullyDilutedValuation,
        totalVolume,
        high24h,
        low24h,
        priceChange24h,
        priceChangePercentage24h,
        marketCapChange24h,
        marketCapChangePercentage24h,
        circulatingSupply,
        totalSupply,
        maxSupply,
        ath,
        athChangePercentage,
        athDate,
        atl,
        atlChangePercentage,
        atlDate,
        roi,
        lastUpdated,
      ];
}

extension CoinDTOMapper on CoinDTO {
  Coin toCoin() => Coin(
        id: id,
        symbol: symbol,
        name: name,
        image: image,
        currentPrice: currentPrice.toDouble(),
        marketCap: marketCap.toDouble(),
        marketCapRank: marketCapRank.toDouble(),
        fullyDilutedValuation: fullyDilutedValuation.toDouble(),
        totalVolume: totalVolume.toDouble(),
        high24h: high24h.toDouble(),
        low24h: low24h.toDouble(),
        priceChange24h: priceChange24h.toDouble(),
        priceChangePercentage24h: priceChangePercentage24h.toDouble(),
        marketCapChange24h: marketCapChange24h.toDouble(),
        marketCapChangePercentage24h: marketCapChangePercentage24h.toDouble(),
        circulatingSupply: circulatingSupply.toDouble(),
        totalSupply: totalSupply.toDouble(),
        maxSupply: maxSupply?.toDouble(),
        ath: ath.toDouble(),
        athChangePercentage: athChangePercentage.toDouble(),
        athDate: athDate,
        atl: atl.toDouble(),
        atlChangePercentage: atlChangePercentage.toDouble(),
        atlDate: atlDate,
        roi: roi?.toCoinRoi(),
        lastUpdated: lastUpdated,
      );
}

class CoinRoiDTO extends Equatable {
  final double times;
  final String currency;
  final double percentage;

  const CoinRoiDTO({
    required this.times,
    required this.currency,
    required this.percentage,
  });

  factory CoinRoiDTO.fromJson(Map<String, dynamic> json) => CoinRoiDTO(
        times: json["times"],
        currency: json["currency"],
        percentage: json["percentage"],
      );

  Map<String, dynamic> toJson() => {
        'times': times,
        'currency': currency,
        'percentage': percentage,
      };

  @override
  List<Object?> get props => [
        times,
        currency,
        percentage,
      ];
}

extension CoinRoiDTOMapper on CoinRoiDTO {
  CoinRoi toCoinRoi() => CoinRoi(
        times: times,
        currency: currency,
        percentage: percentage,
      );
}
