import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/api/response_pokemon.dart';
import 'package:pokedex/database/isfavorite.dart';
import 'package:pokedex/database/pokemon_database.dart';

class DetailPage extends StatefulWidget {
  final Pokemon pokemon;
  final Color color;

  const DetailPage({super.key, required this.pokemon, required this.color});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;
  @override
  void initState() {
    super.initState();
    print(widget.pokemon);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: widget.color,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 30,
            left: 5,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Positioned(
            top: 30,
            right: 5,
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                color: Colors.red,
                size: 30,
              ),
              onPressed: () async {
                setState(() {
                  isFavorite = !isFavorite; // Toggle nilai isFavorite
                });
                if (isFavorite) {
                  await _addFavorite(widget.pokemon.id!);
                } else {
                  await _removeFavorite(widget.pokemon.id!);
                }
              },
            ),
          ),
          Positioned(
              top: 80,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.pokemon.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "#" + widget.pokemon.num,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              )),
          Positioned(
              top: 130,
              left: 22,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.pokemon.type.join(", "),
                    style: TextStyle(color: Colors.white, fontSize: 15),
                    textAlign: TextAlign.left,
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              )),
          Positioned(
            top: height * 0.18,
            right: -30,
            child: Image.asset(
              'images/pokeball.png',
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              'Name',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 17),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokemon.name,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              'Height',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 17),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokemon.height,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              'Weight',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 17),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokemon.weight,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              'Spawn Time',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 17),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokemon.spawnTime,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              'Weakness',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 17),
                            ),
                          ),
                          Container(
                            child: Text(
                              widget.pokemon.weaknesses.join(", "),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              'Pre Evolution',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 17),
                            ),
                          ),
                          Container(
                              child: widget.pokemon.prevEvolution != null
                                  ? SizedBox(
                                      height: 20,
                                      width: width * 0.55,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: widget
                                            .pokemon.prevEvolution!.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              widget.pokemon
                                                  .prevEvolution![index].name,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : Text(
                                      "Just Hatched",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17),
                                    )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: width * 0.3,
                            child: Text(
                              'Next Evolution',
                              style: TextStyle(
                                  color: Colors.blueGrey, fontSize: 17),
                            ),
                          ),
                          Container(
                              child: widget.pokemon.nextEvolution != null
                                  ? SizedBox(
                                      height: 20,
                                      width: width * 0.55,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: widget
                                            .pokemon.nextEvolution!.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Text(
                                              widget.pokemon
                                                  .nextEvolution![index].name,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  : Text(
                                      "Maxed Out",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 17),
                                    )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: (height * 0.2),
            left: (width / 2) - 100,
            child: Hero(
              tag: widget.pokemon.id.toString(),
              child: CachedNetworkImage(
                height: 200,
                width: 200,
                imageUrl: widget.pokemon.img,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _addFavorite(int idPokemon) async {
    final favorite = Favorite(idPokemon: idPokemon);
    await FavoriteDatabase.instance.create(favorite);
  }

  Future<void> _removeFavorite(int idPokemon) async {
    await FavoriteDatabase.instance.deleteFavoriteById(idPokemon);
  }
}
