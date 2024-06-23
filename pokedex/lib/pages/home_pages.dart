import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/api/client.dart';
import 'package:pokedex/api/response_pokemon.dart';
import 'package:pokedex/pages/detail_page.dart';
import 'package:pokedex/pages/favorite_page.dart';
import 'package:pokedex/pages/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Pokemon> pokedex = [];
  bool isLoading = false;
  late double width;

  Future<void> getPokedex() async {
    setState(() {
      isLoading = true;
    });

    pokedex = await Client.fetchPokemon();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getPokedex();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      endDrawer: buildDrawer(context, pokedex),
      body: Stack(
        children: [
          Positioned(
            top: -50,
            right: -50,
            child: Image.asset(
              'images/pokeball.png',
              width: 200,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            child: Text(
              'Pokedex',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Positioned(
            top: 150,
            bottom: 0,
            width: width,
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.4,
                          ),
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: pokedex.length,
                          itemBuilder: (context, index) {
                            Pokemon pokemon = pokedex[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 5,
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => DetailPage(
                                        pokemon: pokemon,
                                        color: Widgets.decideColor(pokemon),
                                      ),
                                    ),
                                  );
                                },
                                child: SafeArea(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Widgets.decideColor(pokemon),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(25),
                                      ),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: -10,
                                          right: -10,
                                          child: Image.asset(
                                            'images/pokeball.png',
                                            height: 100,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 5,
                                          right: 5,
                                          child: Hero(
                                            tag: pokemon.id.toString(),
                                            child: CachedNetworkImage(
                                              imageUrl: pokemon.img,
                                              height: 100,
                                              fit: BoxFit.fitHeight,
                                              placeholder: (context, url) =>
                                                  Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 55,
                                          left: 15,
                                          child: Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                left: 10.0,
                                                right: 10,
                                                top: 5,
                                                bottom: 5,
                                              ),
                                              child: Text(
                                                pokemon.type.join(', '),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  shadows: [
                                                    BoxShadow(
                                                      color: Colors.blueGrey,
                                                      offset: Offset(0, 0),
                                                      spreadRadius: 1.0,
                                                      blurRadius: 15,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20),
                                              ),
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 30,
                                          left: 15,
                                          child: Text(
                                            pokemon.name,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.white,
                                              shadows: [
                                                BoxShadow(
                                                  color: Colors.blueGrey,
                                                  offset: Offset(0, 0),
                                                  spreadRadius: 1.0,
                                                  blurRadius: 15,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ),
          Positioned(
            top: 0,
            child: Container(
              height: 150,
              width: width,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDrawer(BuildContext context, List<Pokemon> pokedex) {
    final double headerHeight = 100.0; // Tentukan tinggi header
    final double fontSize = 24.0; // Ukuran font teks header
    final double lineHeight = 1.2; // Line height untuk teks
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.8),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: headerHeight,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.8),
                ),
                child: Center(
                  child: Text(
                    'Drawer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border:
                      Border.all(color: Colors.white), // Tambahkan border putih
                  borderRadius:
                      BorderRadius.circular(20.0), // Atur border radius
                ),
                child: Text(
                  'Favorites',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoritePage(
                      pokedex: pokedex,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
