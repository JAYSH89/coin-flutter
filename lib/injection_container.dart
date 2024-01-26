import 'package:coin_flutter/data/datasources/coin_remote_data_source.dart';
import 'package:coin_flutter/data/datasources/coin_remote_data_source_impl.dart';
import 'package:coin_flutter/data/repositories/coin_repository_impl.dart';
import 'package:coin_flutter/domain/repositories/coin_repository.dart';
import 'package:coin_flutter/domain/usecases/get_all_coins.dart';
import 'package:coin_flutter/domain/usecases/get_coin.dart';
import 'package:coin_flutter/domain/usecases/get_trending_coins.dart';
import 'package:coin_flutter/presentation/bloc/trending/trending_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void setupLocator() {
  // bloc
  getIt.registerFactory(() => TrendingBloc(getIt()));

  // use case
  getIt.registerLazySingleton(() => GetTrendingCoinsUseCase(getIt()));
  getIt.registerLazySingleton(() => GetAllCoinsUseCase(getIt()));
  getIt.registerLazySingleton(() => GetCoinUseCase(getIt()));

  // repository
  getIt.registerLazySingleton<CoinRepository>(() {
    return CoinRepositoryImpl(coinRemoteDataSource: getIt());
  });

  // data source
  getIt.registerLazySingleton<CoinRemoteDataSource>(() {
    return CoinRemoteDataSourceImpl(client: getIt());
  });

  // other
  getIt.registerLazySingleton(() => http.Client());
}
