import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc2/presentation/domain/repository/poke_repository.dart';
import 'package:flutter_bloc2/presentation/home/cubit/counter_cubit.dart';
import 'package:flutter_bloc2/presentation/home/cubit/counter_state.dart';
import 'package:flutter_bloc2/presentation/home/widgets/custom_alert.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => HomeCubit(pokeRepository: context.read<PokeRepository>())
          ..getFakeData(),
        child: const MyHomeView());
  }
}

class MyHomeView extends StatelessWidget {
  const MyHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Bloc/Cubit'),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is HomeSuccess) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Pokemon Ditto',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  ...state.pokemon.abilities
                      .map((ability) => Text(ability.ability.name))
                ],
              ),
            );
          }
          if (state is HomeError) {
            return const Center(
              child: Text('Error'),
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: (context),
              builder: (builder) {
                return BlocProvider.value(
                  value: context.read<HomeCubit>(),
                  child: const CustomAlert(),
                );
              });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

