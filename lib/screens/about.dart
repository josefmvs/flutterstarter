import 'package:flutter/material.dart';
class About extends StatefulWidget {

  About({Key key, this.tabController}) : super(key: key);

  final PageController tabController;

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {

  @override
  Widget build (BuildContext context) => new Scaffold(

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
    body: new PageView(
      children: <Widget>[
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('About page content'),
            RaisedButton(
              // If onPressed is null, the button is disabled
              // this is my goto temporary callback.
              onPressed: () {
                //widget.tabController.jumpToPage(3);
                return new Future.delayed(const Duration(seconds: 5), () {
                  Navigator.pop(context, true);
                });


              },
              //print('PRESSED'),
              color: Colors.indigoAccent,
              child: Text('Back to tabs'),
            )
          ],
        )
      ],
    ),
  );
}

//
//class About extends StatelessWidget {
//  About({Key key, this.tabController }) : super(key: key);
//
//  final PageController tabController;
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
//            onPressed: () => widget.tabController.animateTo(2,
//                duration: const Duration(milliseconds: 300),
//                curve: Curves.ease,
//              ),
//              //print('PRESSED'),
//              color: Colors.indigoAccent,
//              child: Text('Submit Pup'),
//            )
//          ],
//        )
//      ],
//    ),
//  );
//}