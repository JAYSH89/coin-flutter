import 'package:coin_flutter/domain/models/trending/trending.dart';
import 'package:coin_flutter/domain/models/trending/trending_coin.dart';
import 'package:coin_flutter/injection_container.dart';
import 'package:coin_flutter/presentation/bloc/trending/trending_bloc.dart';
import 'package:coin_flutter/presentation/widgets/CoinAppBar.dart';
import 'package:coin_flutter/presentation/widgets/theme/typography.dart';
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

class TrendingView extends StatefulWidget {
  const TrendingView({super.key});

  @override
  State<StatefulWidget> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingView> {
  @override
  void initState() {
    super.initState();
    _loadTrendingData();
  }

  void _loadTrendingData() {
    BlocProvider.of<TrendingBloc>(context).add(const OnReloadTrending());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const CoinAppBar(title: 'Trending'),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_buildBody()],
        ),
      );

  _buildBody() {
    return BlocBuilder<TrendingBloc, TrendingState>(builder: (context, state) {
      switch (state) {
        case TrendingInitial():
          return _emptyContent(context);
        case TrendingLoading():
          return _loadingContent();
        case TrendingSuccess():
          return _successContent(state.result);
        case TrendingError():
          return _error(state.message);
        default:
          return _emptyContent(context);
      }
    });
  }

  Widget _emptyContent(BuildContext context) => Center(
        child: MaterialButton(
          onPressed: () {
            BlocProvider.of<TrendingBloc>(context)
                .add(const OnReloadTrending());
          },
          child: const Text('Refresh'),
        ),
      );

  Widget _loadingContent() => const Center(child: CircularProgressIndicator());

  Widget _successContent(Trending trending) => Expanded(
        child: ListView.builder(
          itemCount: trending.coins.length,
          itemBuilder: (context, index) => _coinCard(trending.coins[index]),
        ),
      );

  Widget _error(String message) => Center(child: Text(message));

  Widget _coinCard(TrendingCoin coin) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            _coinCardLogo(coin.largeUrl),
            _coinCardName(coin.name, coin.symbol),
          ],
        ),
      );

  Widget _coinCardLogo(String url) => ClipOval(
        child: SizedBox.fromSize(
          size: const Size.fromRadius(32),
          child: Image.network(url),
        ),
      );

  Widget _coinCardName(String abbreviation, String name) => Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(abbreviation, style: satoshiBold),
            Text(name, style: satoshiRegular),
          ],
        ),
      );
}
