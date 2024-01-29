import 'package:coin_flutter/data/models/mappable/date_time_hook.dart';
import 'package:coin_flutter/data/models/mappable/double_hook.dart';
import 'package:coin_flutter/domain/models/coins/coin.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'coin_dto.mapper.dart';

@MappableClass()
class CoinDTO with CoinDTOMappable {
  final String id;

  final String symbol;

  final String name;

  final String image;

  @MappableField(key: 'current_price', hook: DoubleHook())
  final double currentPrice;

  @MappableField(key: 'market_cap', hook: DoubleHook())
  final double marketCap;

  @MappableField(key: 'market_cap_rank', hook: DoubleHook())
  final double marketCapRank;

  @MappableField(key: 'fully_diluted_valuation', hook: DoubleHook())
  final double? fullyDilutedValuation;

  @MappableField(key: 'total_volume', hook: DoubleHook())
  final double totalVolume;

  @MappableField(key: 'high_24h', hook: DoubleHook())
  final double high24h;

  @MappableField(key: 'low_24h', hook: DoubleHook())
  final double low24h;

  @MappableField(key: 'price_change_24h', hook: DoubleHook())
  final double priceChange24h;

  @MappableField(key: 'price_change_percentage_24h', hook: DoubleHook())
  final double priceChangePercentage24h;

  @MappableField(key: 'market_cap_change_24h', hook: DoubleHook())
  final double marketCapChange24h;

  @MappableField(key: 'market_cap_change_percentage_24h', hook: DoubleHook())
  final double marketCapChangePercentage24h;

  @MappableField(key: 'circulating_supply', hook: DoubleHook())
  final double circulatingSupply;

  @MappableField(key: 'total_supply', hook: DoubleHook())
  final double? totalSupply;

  @MappableField(key: 'max_supply', hook: DoubleHook())
  final double? maxSupply;

  @MappableField(key: 'ath', hook: DoubleHook())
  final double ath;

  @MappableField(key: 'ath_change_percentage', hook: DoubleHook())
  final double athChangePercentage;

  @MappableField(key: 'ath_date', hook: DateTimeHook())
  final DateTime athDate;

  @MappableField(key: 'atl', hook: DoubleHook())
  final double atl;

  @MappableField(key: 'atl_change_percentage', hook: DoubleHook())
  final double atlChangePercentage;

  @MappableField(key: 'atl_date', hook: DateTimeHook())
  final DateTime atlDate;

  final CoinRoiDTO? roi;

  @MappableField(key: 'last_updated', hook: DateTimeHook())
  final DateTime lastUpdated;

  const CoinDTO({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    this.fullyDilutedValuation,
    required this.totalVolume,
    required this.high24h,
    required this.low24h,
    required this.priceChange24h,
    required this.priceChangePercentage24h,
    required this.marketCapChange24h,
    required this.marketCapChangePercentage24h,
    required this.circulatingSupply,
    this.totalSupply,
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

  static const fromMap = CoinDTOMapper.fromMap;
  static const fromJson = CoinDTOMapper.fromJson;

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

extension CoinDTOExtension on CoinDTO {
  Coin toCoin() => Coin(
        id: id,
        symbol: symbol,
        name: name,
        image: image,
        currentPrice: currentPrice,
        marketCap: marketCap,
        marketCapRank: marketCapRank,
        fullyDilutedValuation: fullyDilutedValuation,
        totalVolume: totalVolume,
        high24h: high24h,
        low24h: low24h,
        priceChange24h: priceChange24h,
        priceChangePercentage24h: priceChangePercentage24h,
        marketCapChange24h: marketCapChange24h,
        marketCapChangePercentage24h: marketCapChangePercentage24h,
        circulatingSupply: circulatingSupply,
        totalSupply: totalSupply,
        maxSupply: maxSupply,
        ath: ath,
        athChangePercentage: athChangePercentage,
        athDate: athDate,
        atl: atl,
        atlChangePercentage: atlChangePercentage,
        atlDate: atlDate,
        roi: roi?.toCoinRoi(),
        lastUpdated: lastUpdated,
      );
}

@MappableClass()
class CoinRoiDTO with CoinRoiDTOMappable {
  final double times;
  final String currency;
  final double percentage;

  static const fromMap = CoinRoiDTOMapper.fromMap;
  static const fromJson = CoinRoiDTOMapper.fromJson;

  const CoinRoiDTO({
    required this.times,
    required this.currency,
    required this.percentage,
  });
}

extension CoinRoiDTOExtension on CoinRoiDTO {
  CoinRoi toCoinRoi() => CoinRoi(
        times: times,
        currency: currency,
        percentage: percentage,
      );
}
