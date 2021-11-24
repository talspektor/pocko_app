import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/data/pokemon_details.dart';
import 'package:poke_app/data/pokemon_info_response.dart';
import 'package:poke_app/data/pokemon_repository.dart';
import 'package:poke_app/data/pokemon_species_info_response.dart';

class PokemonDetailCubit extends Cubit<PokemonDetails?> {
  final _pokemonrepository = PokemonRepository();

  PokemonDetailCubit() : super(null);

  getPokemonDetails(int pokemonId) async {
    final response = await Future.wait([
      _pokemonrepository.getPokemonInfo(pokemonId),
      _pokemonrepository.getPokemonSpeciesInfo(pokemonId)
    ]);

    final pokemonInfo = response[0] as PokemonInfoResponse;
    final speciesInfo = response[1] as PokemonSpeciesInfoResponse;

    emit(PokemonDetails(
      id: pokemonInfo.id,
      name: pokemonInfo.name,
      imageUrl: pokemonInfo.imageUrl,
      types: pokemonInfo.types,
      height: pokemonInfo.height,
      weight: pokemonInfo.weight,
      description: speciesInfo.description,
    ));
  }

  clearPokemonDetails() => emit(null);
}
