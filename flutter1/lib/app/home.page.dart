import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget tile(String title, String route, BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'dart side of flutter'.toUpperCase(),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView(
        itemExtent: 50,
        shrinkWrap: true,
        children: ListTile.divideTiles(
          context: context,
          tiles: [
            tile('Baphometh', '/baphometh', context),
            tile('Česko kontejnery', '/containers', context),
            tile('Donate like a god', '/donate', context),
            tile('KFC?', '/kfc', context),
            tile('Json Voorhees from the future', '/voorhees', context),
            tile('Pokédex', '/pokedex', context),
          ],
        ).toList(),
      ),
    );
  }
}
