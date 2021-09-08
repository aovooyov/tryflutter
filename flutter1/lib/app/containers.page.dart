import 'package:flutter/material.dart';

class ContainersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Česko kontejnery'.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(20, 86, 61, 124),
      ),
      body: ListView(
        children: [
          cesco(),
          grid(),
          card(),
        ],
      ),
    );
  }

  Widget cesco() {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.white,
            height: 100,
          ),
        ),
        Positioned(
          top: 100,
          left: 0,
          right: 0,
          child: Container(
            color: Colors.red,
            height: 100,
          ),
        ),
        ClipPath(
          clipper: TriangleClipper(),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue[700],
          ),
        ),
      ],
    );
  }

  Widget grid() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mix and match',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            'Don’t want your columns to simply stack in some grid tiers? Use a combination of different classes for each tier as needed. See the example below for a better idea of how it all works.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(15, 86, 61, 124),
                    border: Border.all(
                      color: Color.fromARGB(20, 86, 61, 124),
                    ),
                  ),
                  child: Text('.col-md-8'),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(15, 86, 61, 124),
                    border: Border.all(
                      color: Color.fromARGB(20, 86, 61, 124),
                    ),
                  ),
                  child: Text('.col-6 .col-md-4'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(15, 86, 61, 124),
                    border: Border.all(
                      color: Color.fromARGB(20, 86, 61, 124),
                    ),
                  ),
                  child: Text('.col-6 .col-md-4'),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(15, 86, 61, 124),
                    border: Border.all(
                      color: Color.fromARGB(20, 86, 61, 124),
                    ),
                  ),
                  child: Text('.col-6 .col-md-4'),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(15, 86, 61, 124),
                    border: Border.all(
                      color: Color.fromARGB(20, 86, 61, 124),
                    ),
                  ),
                  child: Text('.col-6 .col-md-4'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(15, 86, 61, 124),
                    border: Border.all(
                      color: Color.fromARGB(20, 86, 61, 124),
                    ),
                  ),
                  child: Text('.col-6'),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(15, 86, 61, 124),
                    border: Border.all(
                      color: Color.fromARGB(20, 86, 61, 124),
                    ),
                  ),
                  child: Text('.col-6'),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  Widget card() {
    return Card(
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 40,
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Image.asset('assets/chip.png'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 110,
                      child: Image.network(
                          'https://tinkoffkin.ru/wp-content/uploads/2017/11/emblema-tinkoff-bank.png'),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Wrap(
                  spacing: 10,
                  children: [
                    Text(
                      '5536',
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 26,
                      ),
                    ),
                    Text(
                      'OOOO',
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 26,
                      ),
                    ),
                    Text(
                      'OOOO',
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 26,
                      ),
                    ),
                    Text(
                      '0001',
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  '05/36',
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontSize: 16,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Oleg Tinkoff',
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'master dart',
                          style: TextStyle(
                            color: Colors.grey[200],
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, size.width)
      ..lineTo(size.width, size.height / 2)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
