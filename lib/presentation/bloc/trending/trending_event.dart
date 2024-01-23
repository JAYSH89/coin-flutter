part of 'trending_bloc.dart';

abstract class TrendingEvent extends Equatable {
  const TrendingEvent();

  @override
  List<Object?> get props => [];
}

class OnReloadTrending extends TrendingEvent {
  const OnReloadTrending();

  @override
  List<Object?> get props => [];
}
