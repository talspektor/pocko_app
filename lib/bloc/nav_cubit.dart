import 'package:flutter_bloc/flutter_bloc.dart';

class NavCubit extends Cubit<int?> {
  NavCubit() : super(0);

  void showPokemonDetails(int pokemonId) {
    emit(pokemonId);
  }

  void popToPokedex() {
    emit(null);
  }
}
