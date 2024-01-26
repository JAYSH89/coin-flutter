import 'package:coin_flutter/domain/models/coins/coin_detail.dart';
import 'package:coin_flutter/domain/repositories/coin_repository.dart';

class GetCoinUseCase {
  final CoinRepository repository;

  GetCoinUseCase(this.repository);

  Future<CoinDetail> execute(String id) async {
    return await repository.getCoin(id);
  }
}
