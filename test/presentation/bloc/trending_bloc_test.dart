import 'package:bloc_test/bloc_test.dart';
import 'package:coin_flutter/core/errors/server_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:coin_flutter/domain/models/trending/trending.dart';
import 'package:coin_flutter/presentation/bloc/trending/trending_bloc.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetTrendingCoinsUseCase getTrending;
  late TrendingBloc trendingBloc;

  setUp(() {
    getTrending = MockGetTrendingCoinsUseCase();
    trendingBloc = TrendingBloc(getTrending);
  });

  const testTrending = Trending(coins: [], nfts: [], categories: []);

  test('initial state should be empty', () {
    expect(trendingBloc.state, TrendingInitial());
  });

  blocTest<TrendingBloc, TrendingState>(
    'should emit [TrendingLoading, TrendingSuccess] when get data successful',
    build: () {
      when(getTrending.execute()).thenAnswer((_) async => testTrending);
      return trendingBloc;
    },
    act: (bloc) => bloc.add(const OnReloadTrending()),
    expect: () => <TrendingState>[
      TrendingLoading(),
      const TrendingSuccess(testTrending),
    ],
  );

  blocTest<TrendingBloc, TrendingState>(
    'should emit [TrendingLoading, TrendingError] when get data fails',
    build: () {
      when(getTrending.execute()).thenThrow(ServerException());
      return trendingBloc;
    },
    act: (bloc) => bloc.add(const OnReloadTrending()),
    expect: () => <TrendingState>[
      TrendingLoading(),
      const TrendingError('Oops, something went wrong!'),
    ],
  );
}
