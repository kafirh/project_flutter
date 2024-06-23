import 'dart:convert';

const String table = 'isFavorites';

class FavoriteFields {
  static const String id = 'id';
  static const String idPokemon = 'idPokemon';
}

class Favorite {
  final int? id;
  final int idPokemon;

  Favorite({
    this.id,
    required this.idPokemon,
  });

  Favorite copy({
    int? id,
    int? idPokemon,
  }) {
    return Favorite(
      id: id,
      idPokemon: idPokemon ?? this.idPokemon,
    );
  }

  static Favorite fromJson(Map<String, Object?> json) {
    return Favorite(
      id: json[FavoriteFields.id] as int?,
      idPokemon: json[FavoriteFields.idPokemon] as int,
    );
  }

  Map<String, Object?> toJson() => {
        FavoriteFields.id: id,
        FavoriteFields.idPokemon: idPokemon,
      };
}
