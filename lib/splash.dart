import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  static const routeName = '/';
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _fadeAnimation;
  Animation<Offset> _slideInLeftAnimation;
  Animation<Offset> _slideInBottomAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: Duration(milliseconds: 1500), vsync: this);
    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
    _slideInLeftAnimation =
        Tween<Offset>(begin: Offset(-5.5, 0.0), end: Offset.zero)
            .animate(_animationController)
              ..addListener(() {
                setState(() {});
              });
    _slideInBottomAnimation =
        Tween<Offset>(begin: Offset(0.0, 10.0), end: Offset.zero)
            .animate(_animationController)
              ..addListener(() {
                setState(() {});
              });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _fadeAnimation.addListener(() {
      print('value of fade: ${_fadeAnimation.value}');
    });
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.brown,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: AnimatedOpacity(
                opacity: _fadeAnimation.value,
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
                child: Image.asset(
                  'images/splash.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SlideTransition(
              position: _slideInLeftAnimation,
              child: Text(
                'Welcome to',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
            SlideTransition(
              position: _slideInBottomAnimation,
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
