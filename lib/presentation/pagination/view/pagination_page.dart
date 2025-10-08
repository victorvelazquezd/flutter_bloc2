import 'package:flutter/material.dart';
import 'package:flutter_bloc2/presentation/domain/repository/poke_repository.dart';
import 'package:flutter_bloc2/presentation/pagination/cubit/cubit.dart';
import 'package:flutter_bloc2/presentation/pagination/widgets/pagination_body.dart';

/// {@template pagination_page}
/// A description for PaginationPage
/// {@endtemplate}
class PaginationPage extends StatelessWidget {
  /// {@macro pagination_page}
  const PaginationPage({super.key});

  /// The static route for PaginationPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const PaginationPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaginationCubit(pokeRepository: context.read<PokeRepository>())..getPokemonNames(),
      child: const Scaffold(
        body: PaginationView(),
      ),
    );
  }    
}

/// {@template pagination_view}
/// Displays the Body of PaginationView
/// {@endtemplate}
class PaginationView extends StatelessWidget {
  /// {@macro pagination_view}
  const PaginationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const PaginationBody();
  }
}
