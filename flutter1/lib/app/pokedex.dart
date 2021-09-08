import 'dart:convert';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/app/models/pokemon.dart';
import 'package:http/http.dart' as http;

extension CapExtension on String {
  String get camel => '${this[0].toUpperCase()}${this.substring(1)}';
  String get upper => this.toUpperCase();
  String get lower => this.toLowerCase();
  // String get capitalizeFirstofEach =>
  //     this.split(" ").map((str) => str.capitalize).join(" ");
}

const pokemonColorText = Color(0xFFFFCB05);
const pokemonColorBg = Color(0xFF3D7DCA);
const pokemonColorBorder = Color(0xFF003A70);
const pokemonStyle = TextStyle(
  color: pokemonColorText,
  fontStyle: FontStyle.italic,
  fontWeight: FontWeight.w900,
  shadows: [
    Shadow(
      // bottomLeft
      offset: Offset(-2.5, -2.5),
      color: pokemonColorBorder,
    ),
    Shadow(
      // bottomRight
      offset: Offset(2.5, -2.5),
      color: pokemonColorBorder,
    ),
    Shadow(
      // topRight
      offset: Offset(2.5, 2.5),
      color: pokemonColorBorder,
    ),
    Shadow(
      // topLeft
      offset: Offset(-2.5, 2.5),
      color: pokemonColorBorder,
    ),
  ],
);

class PokedexPage extends StatefulWidget {
  @override
  PokedexState createState() => PokedexState();
}

class PokedexState extends State<PokedexPage> {
  Future<PokemonResult> pokedex;
  bool shader = true;

  @override
  void initState() {
    pokedex = PokedexProvider().fetchPokemons();
    super.initState();
    //this.cena();
  }

  void cena() {
    // AssetsAudioPlayer.newPlayer().open(
    //   Audio('assets/cena.mp3'),
    //   autoStart: true,
    //   showNotification: true,
    // );
    AudioCache player = new AudioCache();
    player.play('assets/cena.mp3');
    print('cena');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pokédex',
          style: pokemonStyle,
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF3D7DCA),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/pokemon-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: bodyBuilder(),
      ),
    );
  }

  Widget bodyBuilder() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 300,
                  padding: EdgeInsets.all(16),
                  child: shader
                      ? ShaderMask(
                          blendMode: BlendMode.srcATop,
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              colors: [Colors.orange, Colors.yellow],
                            ).createShader(bounds);
                          },
                          child: Image.asset('assets/cena.png'),
                        )
                      : Image.asset('assets/cena.png'),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/who.png',
                      width: 120,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Column(
                children: [
                  pokemonButton(
                    'Who\'s That Pokémon',
                    icon: Icons.help,
                    onPressed: () {},
                    fontSize: 24,
                  ),
                  Expanded(
                    child: pokemonsBuilder(),
                  ),
                ],
              )),
        ),
      ],
    );
  }

  Widget pokemonsBuilder() {
    return FutureBuilder<PokemonResult>(
      future: pokedex,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.results.length,
            itemBuilder: (context, index) {
              final pokemon = snapshot.data.results[index];

              return pokemonButton(
                pokemon.name,
                icon: Icons.error_outline,
                onPressed: () {
                  setState(() {
                    shader = !shader;
                  });
                },
                bg: pokemonColorBg.withAlpha(111),
              );
            },
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget pokemonButton(String title,
      {Function onPressed,
      IconData icon,
      double fontSize = 20,
      Color bg = pokemonColorBg}) {
    return RaisedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            // 'Which Pokémon Today',
            title.camel,
            style: pokemonStyle.copyWith(
              fontSize: fontSize,
            ),
          ),
          Container(
            decoration: new BoxDecoration(
              color: pokemonColorBorder,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: pokemonColorText,
            ),
          ),
        ],
      ),
      color: bg,
    );
  }
}

class PokeballProvider extends ChangeNotifier {}

class PokedexProvider {
  final pokemonListUrl = 'https://pokeapi.co/api/v2/pokemon/';

  Future<PokemonResult> fetchPokemons() async {
    final response = await http.get(pokemonListUrl);

    if (response.statusCode == 200) {
      final result = PokemonResult.fromJson(json.decode(response.body));
      result.results.insert(0, Pokemon(name: 'Artem Dzyuba'));
      result.results.insert(0, Pokemon(name: 'John Cena'));

      return result;
    }

    throw Exception('Error: ${response.reasonPhrase}');
  }
}
