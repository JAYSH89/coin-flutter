import 'package:flutter/material.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({super.key});

  @override
  Widget build(BuildContext context) => const _MarketView();
}

class _MarketView extends StatelessWidget {
  const _MarketView({super.key});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_buildBody()],
      );

  Widget _buildBody() => const Text('market page.');
}
