class PokemonInfoResponse {
  final int id;
  final String name;
  final String imageUrl;
  final List<String> types;
  final int height;
  final int weight;

  PokemonInfoResponse({
    required this.id,
    required this.types,
    required this.name,
    required this.imageUrl,
    required this.height,
    required this.weight,
  });

  factory PokemonInfoResponse.fromJson(Map<String, dynamic> json) {
    final types = (json['types'] as List)
        .map((typeJson) => typeJson['type']['name'] as String)
        .toList();

    return PokemonInfoResponse(
      id: json['id'],
      types: types,
      imageUrl: json['sprites']['front_default'],
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
    );
  }
}
