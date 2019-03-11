import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final title;
  final subtitle;
  final textColor;
  ProfileTile({this.title, this.subtitle, this.textColor = Colors.black});
  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
              fontSize: 13.0, fontWeight: FontWeight.normal, color: textColor),
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(
          subtitle,
          style: TextStyle(
              fontSize: 11.0, fontWeight: FontWeight.normal, color: textColor),
        ),
      ],
    );
  }
}
