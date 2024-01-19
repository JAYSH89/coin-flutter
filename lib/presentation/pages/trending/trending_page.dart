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
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Hello world')],
          ),
        ),
      );
  }
}
