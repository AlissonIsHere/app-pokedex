import 'package:app_pokedex/Model/Repositories/repository.dart';
import 'package:app_pokedex/Presenter/pokemon_presenter.dart';
import 'package:app_pokedex/View/detalhes_page.dart';
import 'package:app_pokedex/View/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Model/Repositories/repository.dart';

void main() {

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => PokemonPresenter(PokemonRepository()),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const Pokedex(),
        '/Detalhes': (context) => const Detalhes(),
      },
      initialRoute: '/',
    );
  }
}
