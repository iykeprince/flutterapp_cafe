import 'package:flutter/material.dart';

main() => runApp(Home());

// #EDE7E6;
// RGB(237,231, 230)

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Coffee> coffeeList = List<Coffee>();
  @override
  void initState() {
    super.initState();
    this.coffeeList.add(new Coffee('../images/coffee/coffee-1.png', 'Cappuccino', 'Coffee 1', 329.0));
    this.coffeeList.add(new Coffee('../images/coffee/coffee-2.png', 'Caffè Americano', 'Coffee 2', 299.0));
    this.coffeeList.add(new Coffee('../images/coffee/coffee-3.png', 'Espresso', 'Lattes', 249.0));
    this.coffeeList.add(new Coffee('../images/coffee/coffee-4.png', 'Robusta', 'Coffee 4', 319.0));
    this.coffeeList.add(new Coffee('../images/coffee/coffee-5.png', 'Café Latte', 'Macchiatos', 199.0));
    this.coffeeList.add(new Coffee('../images/coffee/coffee-6.png', 'Flat White', 'Coffee 6', 219.0));
    this.coffeeList.add(new Coffee('../images/coffee/coffee-7.png', 'Short Macchiato', 'Dollop', 289.0));
    this.coffeeList.add(new Coffee('../images/coffee/coffee-8.png', 'Affogato', 'Coffee 8', 275.0));
    this.coffeeList.add(new Coffee('../images/coffee/coffee-9.png', 'Mocha', 'Coffee 9', 315.0));
    this.coffeeList.add(new Coffee('../images/coffee/coffee-10.png', 'Ristretto', 'Coffee 10', 264.0));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(1, 237, 231, 230),
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                'Select',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w100),
              ),
              Text(
                'Coffee',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          PageView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) => _pageItem(coffeeList, index),
          )
        ],
      ),
    );
  }
}

Widget _pageItem(List<Coffee> coffeeList, int index) {
  return Container(
    color: Colors.white,
    width: 200,
    height: 200,
    child: Stack(
      children: <Widget>[
        Container(
          child: Image.asset(coffeeList[index].url),
        ),
        Column(
          children: <Widget>[
            Text(coffeeList[index].category,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Color.fromARGB(1, 237, 231, 230),
                )),
            Text(coffeeList[index].title,
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        Center(
          child: Text(coffeeList[index].price.toString(),
          style: TextStyle(fontWeight: FontWeight.bold),),
        )
      ],
    ),
  );
}

PageController _pageViewController() {}

class Coffee {
  String url, category, title;
  double price;

  Coffee(this.url, this.category, this.title, this.price);
}
