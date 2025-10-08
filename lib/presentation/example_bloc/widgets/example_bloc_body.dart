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
        return Center(child: Text(''));
      },
    );
  }
}
