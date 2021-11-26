
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/bloc/pokemon_details_cubit.dart';
import 'package:poke_app/data/pokemon_details.dart';

class PokemonDetailsView extends StatelessWidget {
  const PokemonDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      backgroundColor: const Color(0xfff2f2f2),
      body: BlocBuilder(
        bloc: BlocProvider.of<PokemonDetailCubit>(context),
        builder: (context, state) {
          if (state is PokemonDetails) {
            return Center(
                child: Column(
              children: [
                Expanded(
                  flex: 1,
                    child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.network(state.imageUrl),
                      Text(state.name),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: state.types
                            .map((type) => _pokemonTypeView(type))
                            .toList(),
                      ),
                      Text(
                          'ID: ${state.id}  -  Weight: ${state.weight}  - Height: ${state.height}'),
                    ],
                  ),
                )),
                Expanded(
                  flex: 2,
                    child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        state.description,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ))
              ],
            ));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget _pokemonTypeView(String type) {
    Color color;

    switch (type) {
      case 'normal':
        color = const Color(0xffbdbeb0);
        break;
      case 'poison':
        color = const Color(0xff995e98);
        break;
      case 'psychic':
        color = const Color(0xffe96eb0);
        break;
      case 'grass':
        color = const Color(0xff9cd363);
        break;
      case 'ground':
        color = const Color(0xffe3c969);
        break;
      case 'ice':
        color = const Color(0xffaff4fd);
        break;
      case 'fire':
        color = const Color(0xffe7614d);
        break;
      case 'rock':
        color = const Color(0xffcbbd7c);
        break;
      case 'dragon':
        color = const Color(0xff8475f7);
        break;
      case 'water':
        color = const Color(0xff6dacf8);
        break;
      case 'bug':
        color = const Color(0xffc5d24a);
        break;
      case 'dark':
        color = const Color(0xff996958);
        break;
      case 'fighting':
        color = const Color(0xff9e5a4a);
        break;
      case 'ghost':
        color = const Color(0xff7774cf);
        break;
      case 'steel':
        color = const Color(0xffc3c3d9);
        break;
      case 'flying':
        color = const Color(0xff81a2f8);
        break;
      case 'normal':
        color = const Color(0xfff9e65e);
        break;
      case 'fairy':
        color = const Color(0xffffb0fa);
        break;
      default:
        color = Colors.black;
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Text(
          type.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
