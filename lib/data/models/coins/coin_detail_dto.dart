import 'package:coin_flutter/data/models/mappable/date_time_hook.dart';
import 'package:coin_flutter/data/models/mappable/double_hook.dart';
import 'package:coin_flutter/data/models/mappable/int_hook.dart';
import 'package:coin_flutter/domain/models/coins/coin_detail.dart';
import 'package:dart_mappable/dart_mappable.dart';

part 'coin_detail_dto.mapper.dart';

@MappableClass()
class CoinDetailDTO with CoinDetailDTOMappable {
  @MappableField(key: 'id')
  final String id;

  @MappableField(key: 'symbol')
  final String symbol;

  @MappableField(key: 'name')
  final String name;

  @MappableField(key: 'web_slug')
  final String webSlug;

  @MappableField(key: 'description')
  final CoinDetailDescriptionDTO description;

  @MappableField(key: 'image')
  final CoinDetailImageDTO image;

  @MappableField(key: 'market_cap_rank', hook: IntHook())
  final int marketCapRank;

  @MappableField(key: 'market_data')
  final CoinDetailMarketDataDTO marketData;

  @MappableField(key: 'last_updated', hook: DateTimeHook())
  final DateTime lastUpdated;

  static const fromMap = CoinDetailDTOMapper.fromMap;
  static const fromJson = CoinDetailDTOMapper.fromJson;

  const CoinDetailDTO({
    required this.id,
    required this.symbol,
    required this.name,
    required this.webSlug,
    required this.description,
    required this.image,
    required this.marketCapRank,
    required this.marketData,
    required this.lastUpdated,
  });
}

extension CoinDetailDTOExtension on CoinDetailDTO {
  CoinDetail toCoinDetail() => CoinDetail(
        id: id,
        symbol: symbol,
        name: name,
        webSlug: webSlug,
        description: description.en,
        thumbImage: image.thumbImage,
        smallImage: image.smallImage,
        largeImage: image.largeImage,
        marketCapRank: marketCapRank,
        lastUpdated: lastUpdated,
      );
}

@MappableClass()
class CoinDetailImageDTO with CoinDetailImageDTOMappable {
  @MappableField(key: 'thumb')
  final String thumbImage;

  @MappableField(key: 'small')
  final String smallImage;

  @MappableField(key: 'large')
  final String largeImage;

  static const fromMap = CoinDetailImageDTOMapper.fromMap;
  static const fromJson = CoinDetailImageDTOMapper.fromJson;

  const CoinDetailImageDTO({
    required this.thumbImage,
    required this.smallImage,
    required this.largeImage,
  });
}

@MappableClass()
class CoinDetailDescriptionDTO with CoinDetailDescriptionDTOMappable {
  @MappableField(key: 'en')
  final String en;

  static const fromMap = CoinDetailDescriptionDTOMapper.fromMap;
  static const fromJson = CoinDetailDescriptionDTOMapper.fromJson;

  const CoinDetailDescriptionDTO({required this.en});
}

@MappableClass()
class CoinDetailMarketDataDTO with CoinDetailMarketDataDTOMappable {
  @MappableField(key: 'current_price')
  final CoinDetailCurrentPriceDTO currentPrice;

  static const fromMap = CoinDetailMarketDataDTOMapper.fromMap;
  static const fromJson = CoinDetailMarketDataDTOMapper.fromJson;

  const CoinDetailMarketDataDTO({required this.currentPrice});
}

@MappableClass()
class CoinDetailCurrentPriceDTO with CoinDetailCurrentPriceDTOMappable {
  @MappableField(key: 'eur', hook: DoubleHook())
  final double eur;

  @MappableField(key: 'usd', hook: DoubleHook())
  final double usd;

  static const fromMap = CoinDetailCurrentPriceDTOMapper.fromMap;
  static const fromJson = CoinDetailCurrentPriceDTOMapper.fromJson;

  const CoinDetailCurrentPriceDTO({required this.eur, required this.usd});
}

extension CoinDetailCurrentPriceDTOExtension on CoinDetailCurrentPriceDTO {
  CoinDetailCurrentPrice toCoinDetailCurrentPrice() {
    return CoinDetailCurrentPrice(eur: eur, usd: usd);
  }
}
