import 'package:dio/dio.dart';
import 'package:flutter_bloc2/presentation/data/models/poke_result_model.dart';
import 'package:flutter_bloc2/presentation/data/models/pokemon_model.dart';

class PokeApi{
  final Dio dio = Dio();

  final String api = "https://pokeapi.co/api/v2/";
  final String ditoEndpoint = "pokemon/ditto";

  Future<Pokemon> getPokemon() async{
    try { 
      final response = await dio.get('$api$ditoEndpoint');
      return Pokemon.fromJson(response.data);
      
    } catch (e) {
      throw Exception('Get Pokemon error');
      
    }
  }

  Future<PokeResult> getPokemonList({required int offset})async{
    try {
      final response = await dio.get("${api}pokemon?limit=20&offset=$offset");
      return PokeResult.fromJson(response.data);
    } catch (e) {
      throw Exception('Get Pokemon List Error');
    }
  }
}