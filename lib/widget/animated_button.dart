import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  AnimatedButton({
    Key key,
    this.text,
    this.onTap,
    this.colors,
  }) : super(key: key);
  final String text;
  final Function onTap;
  final String colors;

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with TickerProviderStateMixin {
  AnimationController _controller;

  ButtonState _buttonState = ButtonState.COLLAPSED;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200))
          ..addListener(() {
            if (_controller.status == AnimationStatus.completed) {
              setState(() {
                _buttonState = ButtonState.COLLAPSED;
              });
            }
          });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: _buttonState == ButtonState.COLLAPSED ? 200 : 300,
      height: 70,
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          _controller.forward();
          setState(() {
            _buttonState = ButtonState.EXPANDED;
          });
          widget.onTap();
        },
        child: Container(
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: widget.colors == 'blue' ? Colors.blue : Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}

enum ButtonState { EXPANDED, COLLAPSED }
