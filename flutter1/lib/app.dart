import 'package:flutter/material.dart';
import 'package:flutter1/app/pokedex.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter1/app/baphometh.page.dart';
import 'package:flutter1/app/home.page.dart';
import 'package:flutter1/app/containers.page.dart';
import 'package:flutter1/app/donate.page.dart';
import 'package:flutter1/app/kfc.page.dart';
import 'package:flutter1/app/voorhees.page.dart';

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  Widget splash() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      child: SplashScreen(
        seconds: 14,
        navigateAfterSeconds: HomePage(),
        title: Text(
          '''DISCLAIMER: 
This app is NOT work undertaken for my employers, past nor present and constitutes only bullshit. The views contained within this app, are in NO way unduly representative of my personal nor professional association with others.

Your perception of it's content and the manner in which you communicate this perception with others requires you to acknowledge and abide by any law within the respective geographical and political region/s within which you reside. I respectfully do not care what your opinion is of this app should you wish to criticise, be offended by or draw down conclusions from it's content.

If you have nothing to say that is constructive or positively meaningful then close off this app immediately.''',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
        image: Image.asset('assets/cross-action.png'),
        photoSize: 45.0,
        styleTextUnderTheLoader: TextStyle(),
        loaderColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: splash(),
      routes: {
        '/baphometh': (context) => BaphomethPage(),
        '/containers': (context) => ContainersPage(),
        '/donate': (context) => DonatePage(),
        '/kfc': (context) => KfcPage(),
        '/voorhees': (context) => JsonVoorheesPage(),
        '/pokedex': (context) => PokedexPage(),
      },
    );
  }
}
