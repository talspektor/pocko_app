import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/bloc/pokemon_event.dart';
import 'package:poke_app/bloc/pokemon_state.dart';
import 'package:poke_app/pokemon_repository.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _pokemonRepository = PokemonRepository();

  PokemonBloc() : super(PokemonInitial());

  @override
  Stream<PokemonState> mapEventToState(PokemonEvent event) async* {
    if (event is PokemonPageRequest) {
      yield PokemonLoadInProgress();

      try {
        final pokemonPageResponse =
            await _pokemonRepository.getPokemonPage(event.page);
        yield PokemonPageLoadSuccess(
            canLoadNextPage: pokemonPageResponse.canLoadNextPage,
            pokemonListings: pokemonPageResponse.pokemonListings);
      } catch (e) {
        yield PokemonPageLoadFailed(error: e as Error);
      }
    }
  }
}
