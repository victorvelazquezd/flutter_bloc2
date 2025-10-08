import 'package:flutter/material.dart';
import 'package:flutter_bloc2/presentation/example_bloc/bloc/bloc.dart';
import 'package:flutter_bloc2/presentation/example_bloc/widgets/example_bloc_body.dart';

/// {@template example_bloc_page}
/// A description for ExampleBlocPage
/// {@endtemplate}
class ExampleBlocPage extends StatelessWidget {
  /// {@macro example_bloc_page}
  const ExampleBlocPage({super.key});

  /// The static route for ExampleBlocPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const ExampleBlocPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExampleBlocBloc(),
      child: const Scaffold(
        body: ExampleBlocView(),
      ),
    );
  }    
}

/// {@template example_bloc_view}
/// Displays the Body of ExampleBlocView
/// {@endtemplate}
class ExampleBlocView extends StatelessWidget {
  /// {@macro example_bloc_view}
  const ExampleBlocView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ExampleBlocBody();
  }
}
