import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  String text;
  Function onPressed;
  Color color;

  BlueButton(this.text, {@required this.onPressed, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: this.onPressed,
      color: color,
      child: Text(
        this.text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
