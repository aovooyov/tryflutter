import 'dart:math';
import 'package:flutter/material.dart';

class BasketItem {
  final String title;
  final String subtitle;
  final double price;
  int count;

  BasketItem({this.title, this.subtitle, this.count, this.price});

  double sum() {
    return price * count;
  }
}

const kfcAccent = 0xffe4002b;
final Random random = Random(DateTime.now().second);
final List<BasketItem> basketDuet = [
  BasketItem(
    title: 'Стрипсы острые',
    subtitle: '3 Стрипса Острые, 186 Г, 240 Ккал',
    count: 1,
    price: 114.0,
  ),
  BasketItem(
    title: 'Крылья',
    subtitle: '3 Острых Крыла, 150 Г, 304 Ккал',
    count: 2,
    price: 124.0,
  ),
  BasketItem(
    title: 'Байтс',
    subtitle: 'Байтс малые, 135 Г, 220 Ккал',
    count: 1,
    price: 94.0,
  ),
  BasketItem(
    title: 'Наггетсы',
    subtitle: '6 Наггетсов',
    count: 1,
    price: 69.0,
  ),
  BasketItem(
    title: 'Пати бокс',
    subtitle:
        'байтсы, картофель фри стандартный и соус - идеальный набор для легкого перекуса',
    count: 1,
    price: 104.37,
  ),
  BasketItem(
    title: 'Баскет 5 ножек',
    subtitle:
        'Баскетов много не бывает. Встречайте новинку! Баскет 5 ножек, 2 картофеля фри малых.',
    count: 1,
    price: 164.0,
  ),
  BasketItem(
    title: 'Микс Бокс',
    subtitle: 'Байтс 95гр+5 наггетс',
    count: 1,
    price: 149.0,
  ),
  BasketItem(
    title: 'Мой Баскет со Стрипсами',
    subtitle: '3 стрипса + картофель фри стандартный.',
    count: 3,
    price: 119.0,
  )
];

class KfcPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BasketWidget();
  }
}

class BasketWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BasketState();
}

class BasketInheritedWidget extends InheritedWidget {
  final BasketState state;

  BasketInheritedWidget({Key key, Widget child, @required this.state})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant BasketInheritedWidget oldWidget) {
    return this.state.basket.length != oldWidget.state.basket.length;
  }

  static BasketInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }
}

class BasketState extends State<BasketWidget> {
  List<BasketItem> basket = List<BasketItem>();

  double checkOffice() {
    if (basket.length == 0) {
      return 0.0;
    }

    return basket.map((e) => e.sum()).reduce((a, b) => a + b);
  }

  int checkLanguage() {
    if (basket.length == 0) {
      return 0;
    }

    return basket.map((e) => e.count).reduce((a, b) => a + b);
  }

  List check() {
    return [checkOffice(), checkLanguage()];
  }

  void pushRandom({int count = 1}) {
    while (count != 0) {
      final int min = 1, max = basketDuet.length;
      final index = min + random.nextInt(max - min);
      final item = basketDuet[index];
      push(item);
      print('$count:${item.title}');
      count--;
    }
  }

  void push(BasketItem item) {
    final index = this.basket.indexWhere((x) => x.title == item.title);

    setState(() {
      if (index != -1) {
        this.basket[index].count++;
        return;
      }

      this.basket.add(item);
    });
  }

  void remove(BasketItem item) {
    final index = this.basket.indexWhere((x) => x.title == item.title);
    if (index == -1) {
      return;
    }

    setState(() {
      if (this.basket[index].count > 1) {
        this.basket[index].count--;
        return;
      }

      this.basket.remove(item);
    });
  }

  void clear() {
    setState(() {
      this.basket.clear();
    });
  }

  @override
  void initState() {
    // basket.addAll([...basketDuet.getRange(1, 3)]);
    pushRandom(count: 3);
    super.initState();
  }

  @override
  void dispose() {
    this.basket.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'KFC'.toUpperCase(),
        ),
        centerTitle: true,
        backgroundColor: Color(kfcAccent),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              clear();
            },
          )
        ],
      ),
      body: BasketInheritedWidget(
          state: this,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 2,
                child: ListView.separated(
                  itemCount: (basket.length + 1),
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    if (index < basket.length) {
                      final item = basket[index];
                      return BasketTile(
                        item: item,
                      );
                    }

                    return Container(
                      width: 170,
                      child: Image.asset('assets/sanders.png'),
                    );
                  },
                ),
              ),
              Divider(),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16).copyWith(bottom: 0, top: 0),
                      child: RaisedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'I\'am so fat'.toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            Icon(Icons.add, color: Colors.white)
                          ],
                        ),
                        color: Color(kfcAccent),
                        onPressed: () {
                          pushRandom();
                        },
                      ),
                    ),
                    Card(
                      color: Color(0xfff7f6f5),
                      margin: EdgeInsets.only(left: 16, right: 16),
                      child: Padding(
                        padding: EdgeInsets.all(16).copyWith(bottom: 0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('count:'),
                                Text(
                                  '${checkLanguage()}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('discount:'),
                                Text(
                                  '0%',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('sum:'),
                                Text(
                                  '${checkOffice()}₽',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16).copyWith(bottom: 0, top: 0),
                      child: RaisedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Buy'.toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            Icon(Icons.pets_outlined, color: Colors.white)
                          ],
                        ),
                        color: Color(kfcAccent),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.black,
                                  content: Container(
                                    height: 300,
                                    color: Colors.black,
                                    child: Image.asset('assets/fat.gif'),
                                  ),
                                );
                              });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class BasketTile extends StatelessWidget {
  final BasketItem item;

  BasketTile({this.item});

  @override
  Widget build(BuildContext context) {
    final basketState = BasketInheritedWidget.of(context).state;

    return ListTile(
      title: Text(this.item.title),
      subtitle: Text(
        this.item.subtitle,
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
      trailing: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          color: Colors.black,
        ),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 4,
          children: [
            IconButton(
              icon: Icon(this.item.count > 1 ? Icons.remove : Icons.delete),
              color: Color(kfcAccent),
              onPressed: () {
                basketState.remove(item);
              },
            ),
            Text(
              '${item.count}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.white,
              onPressed: () {
                basketState.push(item);
              },
            ),
          ],
        ),
      ),
    );
  }
}
