import 'package:app_pokedex/Model/Repositories/repository.dart';
import 'package:flutter/cupertino.dart';

import '../Model/pokemon.dart';

class PokemonPresenter with ChangeNotifier {
  final PokemonRepository repository;

  PokemonPresenter(this.repository);

  List<Pokemon> listPokemon = [];

  bool loading = true;

  void getPokemon() async {
    loading = true;
    notifyListeners();
    listPokemon = await repository.getPokemons();
    loading = false;
    notifyListeners();
  }
}
