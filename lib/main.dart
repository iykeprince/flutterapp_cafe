import 'package:flutter/material.dart';
import 'package:flutterapp/checkout.dart';

import 'home.dart';
import 'detail.dart';
import 'models/coffee.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Cafe',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        DetailScreen.routeName: (context) => DetailScreen(),
        CheckOutScreen.routeName: (context) => CheckOutScreen(),
      },
     
      theme: ThemeData(
        primaryColor: Color.fromRGBO(238, 232, 232, 1),
        accentColor: Color.fromRGBO(114, 98, 230, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    ),
  );
}
