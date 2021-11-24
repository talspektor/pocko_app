import 'package:poke_app/data/pokemon_page_rsponse.dart';

abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoadInProgress extends PokemonState {}

class PokemonPageLoadSuccess extends PokemonState {
  final List<PokemonListing> pokemonListings;
  final bool canLoadNextPage;

  PokemonPageLoadSuccess(
      {required this.canLoadNextPage, required this.pokemonListings});
}

class PokemonPageLoadFailed extends PokemonState {
  final Error error;

  PokemonPageLoadFailed({required this.error});
}
