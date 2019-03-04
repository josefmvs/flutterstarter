import 'package:flutter/material.dart';
import '../screens/about.dart' as _firstTab;
import 'collections.dart' as _secondTab;

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Container(
      child:
          new PageView(
            children: <Widget>[
              new _firstTab.About(),
              new _secondTab.Collections()
            ],
          ),
//          new Icon(
//              Icons.person,
//              size: 150.0,
//              color: Colors.black12
//          ),
//          new Text('Contacts tab content')

  );
}