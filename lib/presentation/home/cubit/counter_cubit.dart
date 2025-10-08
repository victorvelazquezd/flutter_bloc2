import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc2/presentation/domain/repository/poke_repository.dart';
import 'package:flutter_bloc2/presentation/home/cubit/counter_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required PokeRepository pokeRepository})
      : _pokeRepository = pokeRepository,
        super(HomeLoading());

  final PokeRepository _pokeRepository;


  Future<void> getFakeData() async {
    try {
      emit(HomeLoading());
      final pokemon = await _pokeRepository.getPokemon();
      emit(HomeSuccess(pokemon));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
