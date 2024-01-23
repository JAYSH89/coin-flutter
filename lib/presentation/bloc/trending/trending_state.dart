part of 'trending_bloc.dart';

abstract class TrendingState extends Equatable {
  const TrendingState();
}

class TrendingInitial extends TrendingState {
  @override
  List<Object?> get props => [];
}

class TrendingLoading extends TrendingState {
  @override
  List<Object> get props => [];
}

class TrendingSuccess extends TrendingState {
  final Trending result;

  const TrendingSuccess(this.result);

  @override
  List<Object> get props => [result];
}

class TrendingError extends TrendingState {
  final String message;

  const TrendingError(this.message);

  @override
  List<Object> get props => [message];
}
