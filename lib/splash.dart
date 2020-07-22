import 'package:flutter/material.dart';
import 'package:flutterapp/home.dart';

class Splash extends StatefulWidget {
  static const routeName = '/';
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {

  double slideLeft = -2;
  double slideBottom = 2;
  double opacity = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 1000), () => runAnimation());
    Future.delayed(Duration(milliseconds: 3000), () => Navigator.pushNamed(context, HomeScreen.routeName ),);
  }

  void runAnimation() {
    setState(() {
      opacity = 1;
      slideLeft = 0;
      slideBottom = 0.25;
    });
  }

  // @override
  // void dispose() {
  //   _animationController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.brown,
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: AnimatedOpacity(
                    opacity: opacity,
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    child: Image.asset(
                      'images/splash.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                AnimatedAlign(
                  alignment: Alignment(slideLeft, 0),
                  duration: Duration(milliseconds: 900),
                  curve: Curves.easeIn,
                  child: Text(
                    'Welcome to',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            AnimatedAlign(
              alignment: Alignment(0, slideBottom),
              curve: Curves.easeIn,
              duration: Duration(milliseconds: 900),
              child: Text(
                'Coffee App',
                style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildPrevSplash() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(
          children: <Widget>[
            AnimatedContainer(
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(360),
                  )),
              duration: Duration(milliseconds: 1400),
              curve: Curves.easeIn,
              height: 370,
            ),
            AnimatedContainer(
              decoration: BoxDecoration(
                  color: Colors.amber.shade300,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(360),
                    // bottomLeft: Radius.circular(240),
                    // topRight:  Radius.circular(240),
                  )),
              duration: Duration(milliseconds: 500),
              width: 360,
              height: 300,
            ),
            AnimatedContainer(
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(340),
                    bottomLeft: Radius.circular(240),
                    topRight: Radius.circular(300),
                  )),
              duration: Duration(milliseconds: 700),
              width: 200,
              height: 220,
            ),
          ],
        ),
        Expanded(
          child: Text(''),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 28.0),
          child: Align(
            child: AnimatedOpacity(
                opacity: 1,
                duration: Duration(milliseconds: 2400),
                curve: Curves.easeInCirc,
                child: Text(
                  'Cafe',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            alignment: Alignment.bottomCenter,
          ),
        )
      ],
    );
  }
}
