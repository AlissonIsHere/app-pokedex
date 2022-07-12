import 'package:app_pokedex/Model/pokemon.dart';
import 'package:flutter/material.dart';

class Detalhes extends StatelessWidget {
  const Detalhes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final detalhes = ModalRoute.of(context)!.settings.arguments as Pokemon;
    return Scaffold(
      appBar: AppBar(
        title: Text(detalhes.name.toString()),
      ),
      body: Column(children: [
        Card(
            child: Column(children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 218, 218, 218)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: Text('#0${detalhes.id.toString()}')),
                  Image.network(detalhes.thumbnailImage ?? ''),
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(detalhes.description ?? ''),
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Type:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(detalhes.type.toString())),
          ),
          const Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Weakness:',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Align(
              alignment: Alignment.topLeft,
              child: Text(detalhes.weakness.toString()))
        ])),
      ]),
    );
  }
}