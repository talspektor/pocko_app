import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_app/bloc/app_navigator.dart';
import 'package:poke_app/bloc/nav_cubit.dart';
import 'package:poke_app/bloc/pokemon_bloc.dart';
import 'package:poke_app/bloc/pokemon_details_cubit.dart';
import 'package:poke_app/bloc/pokemon_event.dart';
import 'package:poke_app/pokedex_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final pokemonDetailsCubit = PokemonDetailCubit();
    return MaterialApp(
      theme: Theme.of(context)
          .copyWith(primaryColor: Colors.red, accentColor: Colors.redAccent),
      home: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => pokemonDetailsCubit),
        BlocProvider(
            create: (context) =>
                PokemonBloc()..add(PokemonPageRequest(page: 0))),
        BlocProvider(
            create: (context) =>
                NavCubit(pokemonDetailCubit: pokemonDetailsCubit))
      ], child: const AppNavigator()),
    );
  }
}
