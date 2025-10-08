import 'package:flutter_bloc2/presentation/data/models/poke_result_model.dart';
import 'package:flutter_bloc2/presentation/data/models/pokemon_model.dart';
import 'package:flutter_bloc2/presentation/data/services/poke_api.dart';

class PokeRepository{

  PokeRepository({PokeApi? pokeApi}): _pokeApi = pokeApi ?? PokeApi();

  final PokeApi _pokeApi;

  Future<Pokemon> getPokemon() async {
    try {
    return  await _pokeApi.getPokemon();
    } catch (e) {
      throw Exception('Get Pokemon error');
    }
  }

  Future<PokeResult> getPokemonList({required int offset}) async {
    try {
      return await _pokeApi.getPokemonList(offset: offset);
    } catch (e) {
      throw Exception('Get Pokemon error');
    }
  }
}