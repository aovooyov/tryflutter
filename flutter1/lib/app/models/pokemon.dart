const pokemonImg = 'https://pokeres.bastionbot.org/images/pokemon/{id}.png';

class PokemonResult {
  int count;
  String next;
  Null previous;
  List<Pokemon> results;

  PokemonResult({this.count, this.next, this.previous, this.results});

  PokemonResult.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = new List<Pokemon>();
      json['results'].forEach((v) {
        results.add(new Pokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['next'] = this.next;
    data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pokemon {
  String name;
  String url;
  String image;

  Pokemon({this.name, this.url});

  Pokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    // final imageExp = RegExp(r'(\\d+)$');
    // final matches = imageExp.allMatches(url);
    // final id = matches.first.group(0);
    final id = url
        .replaceAll('https://pokeapi.co/api/v2/pokemon/', '')
        .replaceAll('/', '');

    image = pokemonImg.replaceAll('{id}', id != null ? id : '1');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
