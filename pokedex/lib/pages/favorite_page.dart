import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pokedex/api/response_pokemon.dart';
import 'package:pokedex/database/isfavorite.dart';
import 'package:pokedex/database/pokemon_database.dart';
import 'package:pokedex/pages/widgets/widgets.dart';
import 'package:pokedex/pages/detail_page.dart'; // Import halaman DetailPage

class FavoritePage extends StatefulWidget {
  final List<Pokemon> pokedex;
  const FavoritePage({
    Key? key,
    required this.pokedex,
  }) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late List<Favorite> _favorites = [];
  late List<Pokemon> _pokemonfav = [];
  late Map<int, int?> _favoritePercentages =
      {}; // Simpan persentase kesukaan per Pokemon

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    _favorites = await FavoriteDatabase.instance.getAllFavorite();
    _pokemonfav = Widgets.buatPokedex(_favorites, widget.pokedex);

    // Hitung persentase kesukaan untuk setiap Pokemon
    _favoritePercentages = _calculateFavoritePercentages();

    // Urutkan _pokemonfav berdasarkan persentase kesukaan
    _sortFavoritesByPercentage();

    setState(() {});
  }

  // Fungsi untuk menghitung persentase kesukaan setiap Pokemon
  Map<int, int?> _calculateFavoritePercentages() {
    final Map<int, int?> percentages = {};
    for (final pokemon in _pokemonfav) {
      percentages[pokemon.id!] = Random().nextInt(101);
    }
    return percentages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: _pokemonfav.isEmpty
          ? Center(
              child: Text('Tidak ada Pokemon favorit'),
            )
          : ListView.builder(
              itemCount: _pokemonfav.length,
              itemBuilder: (BuildContext context, int index) {
                final pokemon = _pokemonfav[index];
                final favoritePercentage =
                    _favoritePercentages[pokemon.id] ?? 0;
                return Card(
                  color: Widgets.decideColor(pokemon), // Background color hijau
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () {
                        // Navigasi ke halaman detail dengan animasi push
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => DetailPage(
                              pokemon: pokemon,
                              color: Widgets.decideColor(pokemon),
                            ),
                            transitionsBuilder: (_, animation, __, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      leading: Image.network(
                        pokemon.img,
                        width: 50,
                        height: 50,
                      ), // Tampilkan gambar di samping
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                pokemon.name,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Type: ${pokemon.type.join(', ')}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 50, // Ukuran ikon hati
                              ),
                              Text(
                                '$favoritePercentage',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  void _sortFavoritesByPercentage() {
    _pokemonfav.sort((a, b) {
      final percentageA = _favoritePercentages[a.id] ?? 0;
      final percentageB = _favoritePercentages[b.id] ?? 0;
      return percentageB.compareTo(percentageA);
    });
  }
}
