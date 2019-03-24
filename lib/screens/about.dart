import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_starter/scope_model/user.dart';
import 'package:flutter_starter/scope_model/counter.dart';
import 'dart:async';


class About extends StatefulWidget {

  About({Key key, this.tabController}) : super(key: key);

  final PageController tabController;

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {

  var user = User();
  var counter = Counter();

  @override
  Widget build (BuildContext context) {

    ScopedModel.of<User>(context).setValue(5);

    return Scaffold(
                //App Bar
                appBar: new AppBar(
                  title: new Text(
                    'About',
                    style: new TextStyle(
                      fontSize: Theme.of(context).platform == TargetPlatform.iOS ? 17.0 : 20.0,
                    ),
                  ),
                  elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
                ),
                //Content of tabs
                body: Center(
                        child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        Text('You have pushed the button this many times:'),
                        // ScopedModelDescendant looks for an ancestor ScopedModel widget
                        // and retrieves its model (Counter, in this case).
                        // Then it uses that model to build widgets, and will trigger
                        // rebuilds if the model is updated.
                        ScopedModelDescendant<User>(
                          builder: (context, child, user) => Text(
                            '${user.value}',
                            style: Theme.of(context).textTheme.display1,
                          ),
                        ),
                        ScopedModelDescendant<Counter>(
                          builder: (context, child, counter) => Text(
                            '${counter.value}',
                            style: Theme.of(context).textTheme.display1,
                          ),
                        ),
                        RaisedButton(
                            // If onPressed is null, the button is disabled
                            // this is my goto temporary callback.
                            onPressed: () => ScopedModel.of<User>(context).increment(),
                            //print('PRESSED'),
                            color: Colors.indigoAccent,
                            child: Text('Add'),
                          ),
                        RaisedButton(
                          // If onPressed is null, the button is disabled
                          // this is my goto temporary callback.
                          onPressed: () => ScopedModel.of<Counter>(context).counterIncrement(),
                          //print('PRESSED'),
                          color: Colors.indigoAccent,
                          child: Text('Add Counter'),
                        )
                        ],
                        ),
                ),

//                ),
                );


  }
}


//import 'package:flutter/material.dart';
//class About extends StatefulWidget {
//
//  About({Key key, this.tabController}) : super(key: key);
//
//  final PageController tabController;
//
//  @override
//  _AboutState createState() => _AboutState();
//}
//
//class _AboutState extends State<About> {
//
//  @override
//  Widget build (BuildContext context) => new Scaffold(
//
//    //App Bar
//    appBar: new AppBar(
//      title: new Text(
//        'About',
//        style: new TextStyle(
//          fontSize: Theme.of(context).platform == TargetPlatform.iOS ? 17.0 : 20.0,
//        ),
//      ),
//      elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
//    ),
//
//    //Content of tabs
//    body: new PageView(
//      children: <Widget>[
//        new Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new Text('About page content'),
//            RaisedButton(
//              // If onPressed is null, the button is disabled
//              // this is my goto temporary callback.
//              onPressed: () {
//                //widget.tabController.jumpToPage(3);
//                return new Future.delayed(const Duration(seconds: 5), () {
//                  Navigator.pop(context, true);
//                });
//
//
//              },
//              //print('PRESSED'),
//              color: Colors.indigoAccent,
//              child: Text('Back to tabs'),
//            )
//          ],
//        )
//      ],
//    ),
//  );
//}
//
