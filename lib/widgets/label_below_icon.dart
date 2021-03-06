import 'package:flutter/material.dart';

class LabelBelowIcon extends StatelessWidget {
  final label;
  final IconData icon;
  final iconColor;
  final onPressed;
  final circleColor;
  final isCircleEnabled;
  final betweenHeight;
  final VoidCallback callback;

  LabelBelowIcon(
      {
        this.callback,
        this.label,
        this.icon,
        this.onPressed,
        this.iconColor = Colors.white,
        this.circleColor,
        this.isCircleEnabled = true,
        this.betweenHeight = 3.0});

  void calltheCallaback() { callback(); }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          isCircleEnabled
              ? CircleAvatar(
            backgroundColor: circleColor,
            radius: 20.0,
            child: Icon(
              icon,
              size: 15.0,
              color: iconColor,
            ),
          )
              : Icon(
            icon,
            size: 15.0,
            color: iconColor,
          ),
          SizedBox(
            height: betweenHeight,
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.0),
          )
        ],
      ),
    );
  }
}
