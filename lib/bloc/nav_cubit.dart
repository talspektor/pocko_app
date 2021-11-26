import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/bloc/pokemon_details_cubit.dart';

class NavCubit extends Cubit<int?> {
  PokemonDetailCubit pokemonDetailCubit;

  NavCubit({required this.pokemonDetailCubit}) : super(null);

  void showPokemonDetails(int pokemonId) {

    pokemonDetailCubit.getPokemonDetails(pokemonId);
    emit(pokemonId);
  }

  void popToPokedex() {
    emit(null);
    pokemonDetailCubit.clearPokemonDetails();
  }
}
