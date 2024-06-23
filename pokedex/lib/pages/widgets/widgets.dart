import 'package:flutter/material.dart';
import 'package:pokedex/api/response_pokemon.dart';
import 'package:pokedex/database/isfavorite.dart';
import 'package:pokedex/database/pokemon_database.dart';
import 'package:sqflite/sqflite.dart';

class Widgets {
  static Color decideColor(Pokemon pokemon) {
    switch (pokemon.type.first) {
      case "Grass":
        return Colors.greenAccent;
      case "Fire":
        return Color.fromARGB(255, 121, 0, 0);
      case "Water":
        return Colors.blue;
      case "Poison":
        return Colors.deepPurpleAccent;
      case "Electric":
        return Colors.amber;
      case "Rock":
        return Colors.grey;
      case "Ground":
        return Colors.brown;
      case "Psychic":
        return Colors.indigo;
      case "Fighting":
        return Colors.orange;
      case "Bug":
        return const Color.fromARGB(255, 47, 88, 0);
      case "Ghost":
        return Colors.deepPurple;
      case "Normal":
        return Colors.white70;
      default:
        return Colors.pink;
    }
  }

  static List<Pokemon> buatPokedex(
      List<Favorite> favorite, List<Pokemon> pokedex) {
    // Buat set untuk menyimpan ID favorit
    Set<int> favoriteIds = favorite.map((fav) => fav.idPokemon).toSet();

    // Buat daftar Pokemon favorit yang cocok dengan ID favorit
    List<Pokemon> pokemonFav =
        pokedex.where((pokemon) => favoriteIds.contains(pokemon.id)).toList();

    // Penanganan error jika tidak ada Pokemon yang cocok dengan ID favorit
    if (pokemonFav.isEmpty) {
      print('Tidak ada Pokemon favorit yang ditemukan');
      // Atau Anda bisa menampilkan pesan kesalahan ke pengguna
    }

    return pokemonFav;
  }

  static Future<int> countItemsInDatabase() async {
    final db = await FavoriteDatabase.instance.database;
    final result = await db.rawQuery('SELECT COUNT(*) FROM favorites');
    int count = Sqflite.firstIntValue(result)!;
    return count;
  }
}
