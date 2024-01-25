import 'package:coin_flutter/core/errors/server_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:coin_flutter/domain/models/trending/trending.dart';
import 'package:coin_flutter/domain/usecases/get_trending_coins.dart';

part 'trending_event.dart';
part 'trending_state.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  final GetTrendingCoinsUseCase _getTrendingCoins;

  TrendingBloc(this._getTrendingCoins) : super(TrendingInitial()) {
    on<OnReloadTrending>(
      (event, emit) async {
        emit(TrendingLoading());

        try {
          final result = await _getTrendingCoins.execute();
          final success = TrendingSuccess(result);
          emit(success);
        } on ServerException {
          const error = TrendingError('Oops, something went wrong!');
          emit(error);
        }
      },
    );
  }
}
