import 'dart:convert';

import 'package:http/http.dart' as http;

import '../pokemon.dart';

class PokemonRepository {
  Future<List<Pokemon>> getPokemons() async {
    Uri url = Uri.parse('http://104.131.18.84/pokemon/?limit=50&page=0');
    List<Pokemon> listPokemon = [];

    final resultado = await http.get(url);

      if (resultado.statusCode == 200) {
        Map json = const JsonDecoder().convert(resultado.body);
        for (var element in (json['data'] as List)) {
          listPokemon.add(Pokemon.fromJson(element));
        }
            return listPokemon;

      }
          return listPokemon;

    }
  }

