import 'package:app_pokedex/Model/pokemon.dart';
import 'package:app_pokedex/Presenter/pokemon_presenter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pokedex extends StatefulWidget {
  const Pokedex({Key? key}) : super(key: key);

  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  late PokemonPresenter presenter;
  @override
  void initState() {
    presenter = context.read<PokemonPresenter>();
    presenter.getPokemon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokédex'),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            'https://raw.githubusercontent.com/RafaelBarbosatec/SimplePokedex/master/assets/pokebola_img.png',
          ),
        ),
      ),
      body: Consumer<PokemonPresenter>(builder: (_, p, widget) {
        return Stack(
          children: [
            ListView.builder(
                itemCount: presenter.listPokemon.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(23)),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: ListTile(
                            onTap: () {
                              Navigator.pushNamed(context, '/Detalhes',
                                  arguments: presenter.listPokemon[index]);
                            },
                            leading: Image.network(
                              presenter.listPokemon[index].thumbnailImage ?? '',
                              height: 100,
                            ),
                            title: Text(
                              presenter.listPokemon[index].name ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: Text(
                                '#0${presenter.listPokemon[index].id.toString()}')),
                      ),
                    ),
                  );
                }),
            if (presenter.loading)
              const Center(
                child: CircularProgressIndicator(),
              )
          ],
        );
      }),
    );
  }
}

