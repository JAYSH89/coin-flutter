import 'package:coin_flutter/domain/models/coins/coin.dart';
import 'package:coin_flutter/domain/repositories/coin_repository.dart';

class GetAllCoinsUseCase {
  final CoinRepository repository;

  GetAllCoinsUseCase(this.repository);

  Future<List<Coin>> execute() async {
    return await repository.getAllCoins();
  }
}
