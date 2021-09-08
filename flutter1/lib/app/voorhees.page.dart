import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter1/app/models/voorhees.dart';
import 'package:http/http.dart' as http;

class JsonVoorheesPage extends StatefulWidget {
  @override
  JsonVoorheesState createState() => JsonVoorheesState();
}

class JsonVoorheesState extends State<JsonVoorheesPage> {
  Future<Voorhees> voorhess;

  @override
  void initState() {
    voorhess = fetchVoorhees();
    super.initState();
  }

  Future<Voorhees> fetchVoorhees() async {
    const url =
        'https://apilv426.armadyne.xyz/v1/collection/pyatnicza-13-e-kollekciya';

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return Voorhees.fromJson(json.decode(response.body));
    }

    throw Exception('Error: ${response.reasonPhrase}');
  }

  Widget body() {
    return voorheesBuilder();
  }

  Widget voorheesBuilder() {
    return FutureBuilder<Voorhees>(
      future: voorhess,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return voorhessBody(snapshot);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget voorhessBody(AsyncSnapshot<Voorhees> snapshot) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            voorheesAlert(snapshot.data.image);
          },
          child: Container(
            child: Image.network(
              'https:${snapshot.data.backdrop}',
            ),
          ),
        ),
        Expanded(
          child: voorheesListVertical(snapshot),
        ),
      ],
    );
  }

  Widget voorheesListVertical(AsyncSnapshot<Voorhees> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.parts.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Container(
            height: 330,
            child: voorhessListHorizontal(snapshot),
          );
        }

        final part = snapshot.data.parts[index - 1];

        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            voorheesAlert(part.poster);
          },
          child: MediaQuery.removeViewInsets(
            removeRight: true,
            removeLeft: true,
            removeTop: true,
            removeBottom: true,
            context: context,
            child: Card(
              // margin: EdgeInsets.all(4),
              // clipBehavior: Clip.antiAlias,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(8.0),
              // ),
              // elevation: 2,
              child: ListTile(
                // dense: true,
                // contentPadding: EdgeInsets.only(
                //   top: 0.0,
                //   bottom: 0.0,
                //   right: 16,
                // ),
                title: Text(
                  '${part.name}',
                  style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                subtitle: Wrap(
                  spacing: 3.0,
                  children: part.tags
                      .map((e) => Text(
                            e,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ))
                      .toList(),
                ),
                leading: Image.network(
                  'https:${part.poster}',
                ),
                trailing: Text(
                  part.rating.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: part.rating < 5.0
                          ? Colors.red
                          : part.rating >= 5.0 && part.rating < 6.0
                              ? Colors.yellow
                              : Colors.green),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget voorhessListHorizontal(AsyncSnapshot<Voorhees> snapshot) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemExtent: 150,
        itemCount: snapshot.data.parts.length,
        itemBuilder: (context, index) {
          final part = snapshot.data.parts[index];

          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              voorheesAlert(part.poster);
            },
            child: Container(
              // width: 160,
              // height: 250,
              padding: EdgeInsets.all(4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Colors.black,
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(
                      'https:${part.poster}',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, top: 4.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${part.name}',
                          style: TextStyle(
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Wrap(
                          spacing: 3.0,
                          children: part.tags
                              .map((e) => Text(
                                    e,
                                    style: TextStyle(
                                      fontSize: 11,
                                    ),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void voorheesAlert(String poster) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            content: Container(
              color: Colors.black,
              child: Image.network(
                'https:$poster',
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Friday the 13'.toUpperCase(),
              style: TextStyle(
                color: Colors.red,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              'th',
              style: TextStyle(
                color: Colors.red,
                fontStyle: FontStyle.italic,
                fontSize: 16,
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.local_dining_outlined),
            onPressed: () {
              // rerun Future?
            },
          )
        ],
      ),
      body: body(),
    );
  }
}
