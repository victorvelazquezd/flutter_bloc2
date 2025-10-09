import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc2/presentation/data/models/pokemon_model.dart';
import 'package:flutter_bloc2/presentation/domain/repository/poke_repository.dart';
part 'example_bloc_event.dart';
part 'example_bloc_state.dart';

class ExampleBlocBloc extends Bloc<ExampleBlocEvent, ExampleBlocState> {
  ExampleBlocBloc({required PokeRepository pokeRepository}) : _pokeRepository = pokeRepository  ,super( ExampleBlocInitial()) {
    on<GetPokemonBlocEvent>(_onGetPokemonBlocEvent);
  }

  final PokeRepository _pokeRepository;
 

  FutureOr<void> _onGetPokemonBlocEvent(GetPokemonBlocEvent event, Emitter<ExampleBlocState> emit) async {
    try {
      // ignore: unused_local_variable
      final newName = event.name;
      emit(ExampleBlocLoading());
      final pokemon = await _pokeRepository.getPokemon();
      emit(ExampleBlocSuccess(pokemon));
      
    } catch (e) {
      emit(ExampleBlocError(e.toString()));
    }
  }
}
