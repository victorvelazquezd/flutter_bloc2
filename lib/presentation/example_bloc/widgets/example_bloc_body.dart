import 'package:flutter/material.dart';
import 'package:flutter_bloc2/presentation/example_bloc/bloc/bloc.dart';

/// {@template example_bloc_body}
/// Body of the ExampleBlocPage.
///
/// Add what it does
/// {@endtemplate}
class ExampleBlocBody extends StatelessWidget {
  /// {@macro example_bloc_body}
  const ExampleBlocBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExampleBlocBloc, ExampleBlocState>(
      builder: (context, state) {
         if (state is ExampleBlocLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ExampleBlocSuccess) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Pokemon Ditto',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  ...state.pokemon.abilities
                      .map((ability) => Text(ability.ability.name)),
                      ElevatedButton(onPressed: (){
                        context.read<ExampleBlocBloc>().add(const GetPokemonBlocEvent('Example'));
                      }, child: const Text('Refresh'))
                ],
              ),
            );
          }
          if (state is ExampleBlocError) {
            return const Center(
              child: Text('Error'),
            );
          }
          return const SizedBox();}
    );
  }
}
