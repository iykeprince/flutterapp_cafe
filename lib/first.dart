import 'package:flutter/material.dart';
import 'package:flutterapp/main.dart';

// #EDE7E6;
// RGB(237,231, 230)
class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<Coffee> coffeeList = List<Coffee>();
  PageController _pageController = PageController();
  @override
  void initState() {
    this.coffeeList.add(new Coffee(
        '../images/coffee/coffee-1.png', 'Cappuccino', 'Lattesso', 29.0));
    this.coffeeList.add(new Coffee(
        '../images/coffee/coffee-2.png', 'Caffè Americano', 'Coffee 2', 99.0));
    this.coffeeList.add(new Coffee(
        '../images/coffee/coffee-3.png', 'Espresso', 'Lattes', 49.0));
    this.coffeeList.add(new Coffee(
        '../images/coffee/coffee-4.png', 'Robusta', 'Coffee 4', 19.0));
    this.coffeeList.add(new Coffee(
        '../images/coffee/coffee-5.png', 'Café Latte', 'Macchiatos', 199.0));
    this.coffeeList.add(new Coffee(
        '../images/coffee/coffee-6.png', 'Flat White', 'Coffee 6', 21.0));
    this.coffeeList.add(new Coffee(
        '../images/coffee/coffee-7.png', 'Short Macchiato', 'Dollop', 28.0));
    this.coffeeList.add(new Coffee(
        '../images/coffee/coffee-8.png', 'Affogato', 'Coffee 8', 27.0));
    this.coffeeList.add(
        new Coffee('../images/coffee/coffee-9.png', 'Mocha', 'Coffee 9', 31.0));
    this.coffeeList.add(new Coffee(
        '../images/coffee/coffee-10.png', 'Ristretto', 'Coffee 10', 26.0));
    print('init');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.brown.shade200),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                      top: 60,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Select',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Coffee',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontSize: 34.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.only(top: 4, bottom: 8)),
            Expanded(
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeList.length,
                itemBuilder: (context, index) =>
                    _pageItem(context, coffeeList, index),
                pageSnapping: false,
              ),
            ),
            Row(
              children: <Widget>[Padding(padding: const EdgeInsets.all(40))],
            )
          ],
        ),
      ),
    );
  }
}

Widget _pageItem(context, List<Coffee> coffeeList, int index) {
  Coffee coffee = coffeeList[index];
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 0, top: 20),
    child: Container(
      margin: const EdgeInsets.only(left: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(60),
      ),
      child: GestureDetector(
        onTap: () {
          print('${coffee.title} is selected');
          
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyApp(coffee: coffee)));
        },
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: double.maxFinite,
                  alignment: Alignment.topRight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Image.asset("images/coffee/coffee-1.png"),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            coffee.category,
                            style: TextStyle(
                                color: Colors.brown.shade400,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Padding(padding: const EdgeInsets.all(4)),
                          Text(
                            coffee.title,
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            _priceWidget(coffee.price.toString()),
          ],
        ),
      ),
    ),
  );
}

Widget _priceWidget(price) {
  return Align(
    alignment: Alignment.bottomRight,
    child: ConstrainedBox(
      constraints: BoxConstraints(minWidth: 40.0, maxWidth: 100.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '\$',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
            Text(
              price,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    ),
  );
}

class Coffee {
  String url, category, title;
  double price;

  Coffee(this.url, this.category, this.title, this.price);

  @override
  String toString() {
    return "image ${this.url} -> category ${this.category} -> title ${this.title} -> price ${this.price}";
  }
}
