import 'dart:convert';

Pokedex pokedexFromJson(String str) => Pokedex.fromJson(json.decode(str));

String pokedexToJson(Pokedex data) => json.encode(data.toJson());

class Pokedex {
  final List<Pokemon> pokemon;

  Pokedex({required this.pokemon});

  factory Pokedex.fromJson(Map<String, dynamic> json) => Pokedex(
        pokemon:
            List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pokemon": List<dynamic>.from(pokemon.map((x) => x.toJson())),
      };

  getPokemonById(int idPokemon) {}
}

class Pokemon {
  int? id;
  String num;
  String name;
  String img;
  List<String> type;
  String height;
  String weight;
  String spawnTime;
  List<String> weaknesses;
  List<PrevEvolution>? prevEvolution;
  List<NextEvolution>? nextEvolution;
  

  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.spawnTime,
    required this.weaknesses,
    this.prevEvolution,
    this.nextEvolution,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id, // Menambahkan id ke dalam map
      'num': num,
      'name': name,
      'img': img,
      'type': type.join(', '),
      'height': height,
      'weight': weight,
      'spawn_time':
          spawnTime, // Mengubah spawnTime menjadi spawn_time untuk sesuai dengan format yang digunakan dalam database
      'weaknesses': weaknesses.join(', '),
      'prev_evolution':
          prevEvolution != null ? jsonEncode(prevEvolution) : null,
      'next_evolution':
          nextEvolution != null ? jsonEncode(nextEvolution) : null,
    };
  }

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      num: json['num'],
      name: json['name'],
      img: json['img'],
      type: List<String>.from(json['type']),
      height: json['height'],
      weight: json['weight'],
      spawnTime: json['spawn_time'],
      weaknesses: List<String>.from(json['weaknesses']),
      prevEvolution: json['prev_evolution'] != null
          ? List<PrevEvolution>.from(
              json['prev_evolution'].map((x) => PrevEvolution.fromJson(x)))
          : null,
      nextEvolution: json['next_evolution'] != null
          ? List<NextEvolution>.from(
              json['next_evolution'].map((x) => NextEvolution.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'num': num,
      'name': name,
      'img': img,
      'type': type,
      'height': height,
      'weight': weight,
      'spawn_time': spawnTime,
      'weaknesses': weaknesses,
      'prev_evolution': prevEvolution != null
          ? prevEvolution!.map((x) => x.toJson()).toList()
          : null,
      'next_evolution': nextEvolution != null
          ? nextEvolution!.map((x) => x.toJson()).toList()
          : null,
    };
  }
}

class NextEvolution {
  String num;
  String name;

  NextEvolution({
    required this.num,
    required this.name,
  });

  factory NextEvolution.fromJson(Map<String, dynamic> json) => NextEvolution(
        num: json["num"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "num": num,
        "name": name,
      };
}

class PrevEvolution {
  String num;
  String name;

  PrevEvolution({
    required this.num,
    required this.name,
  });

  factory PrevEvolution.fromJson(Map<String, dynamic> json) => PrevEvolution(
        num: json["num"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "num": num,
        "name": name,
      };
}

class Source {
  final String? id;
  final String name;

  Source({
    required this.id,
    required this.name,
  });
  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
