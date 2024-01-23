import 'package:coin_flutter/domain/models/trending/trending.dart';
import 'package:coin_flutter/injection_container.dart';
import 'package:coin_flutter/presentation/bloc/trending/trending_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingPage extends StatelessWidget {
  const TrendingPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => getIt<TrendingBloc>(),
        child: const TrendingView(),
      );
}

class TrendingView extends StatelessWidget {
  const TrendingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF000000),
        title: const Text(
          'Trending',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_buildBody()],
        ),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<TrendingBloc, TrendingState>(builder: (context, state) {
      switch (state) {
        case TrendingInitial():
          return _initial(context);
        case TrendingLoading():
          return _loader();
        case TrendingSuccess():
          return _success(state.result);
        case TrendingError():
          return _error(state.message);
        default:
          return _initial(context);
      }
    });
  }

  Widget _initial(BuildContext context) => Center(
        child: MaterialButton(
          onPressed: () {
            BlocProvider.of<TrendingBloc>(context)
                .add(const OnReloadTrending());
          },
          child: const Text('Refresh'),
        ),
      );

  Widget _loader() => const Center(child: CircularProgressIndicator());

  Widget _success(Trending trending) {
    return Center(child: Text(trending.coins.first.name));
  }

  Widget _error(String message) => Center(child: Text(message));
}
