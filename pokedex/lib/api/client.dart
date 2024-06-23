import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pokedex/api/response_pokemon.dart';

class Client {
  static Future<List<Pokemon>> fetchPokemon() async {
    var url = Uri.https('raw.githubusercontent.com',
        '/Biuni/PokemonGO-Pokedex/master/pokedex.json');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        // Jika status code 200 (OK), maka proses data
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        Pokedex pokedex = Pokedex.fromJson(responseBody);
        return pokedex.pokemon;
      } else {
        // Jika status code bukan 200, tangani kesalahan dengan throw Exception
        throw Exception('Failed to load pokemon');
      }
    } catch (e) {
      // Tangani kesalahan lain yang mungkin terjadi, seperti kesalahan jaringan
      throw Exception('Failed to connect to the server');
    }
  }
}
