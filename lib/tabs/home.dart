import 'package:flutter/material.dart';
import '../screens/about.dart';

class Home extends StatefulWidget {
  Home({Key key, this.tabController, this.title, }) : super(key: key);
 // Home({Key key, this.tabController}) : super(key: key);


  final PageController tabController;
  final String title;

  @override
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // new page needs scaffolding!
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Add a new Dog'),
        //backgroundColor: Colors.black87,
      ),
      body: Center(
        child: SingleChildScrollView(
//          padding: const EdgeInsets.all(5.0),
          child: Container(
//            color: Colors.black54,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 10.0,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    // Text Field is the basic input widget for Flutter.
                    // It comes built in with a ton of great UI and
                    // functionality, such as the labelText field you see below.
                    child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Name the Pup',
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: TextField(
                        decoration: InputDecoration(
                          labelText: "Pup's location",
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'All about the pup',
                      ),
                    ),
                  ),
                  // A Strange situation.
                  // A piece of the app that you'll add in the next
                  // section *needs* to know its context,
                  // and the easiest way to pass a context is to
                  // use a builder method. So I've wrapped
                  // this button in a Builder as a sort of 'hack'.
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Builder(
                      builder: (context) {
                        // The basic Material Design action button.
                        return RaisedButton(
                          // If onPressed is null, the button is disabled
                          // this is my goto temporary callback.
                          onPressed: () =>   //widget.tabController.animateToPage(3, duration: const Duration(milliseconds: 700), curve: Curves.easeOut),
                              Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return About( tabController: widget.tabController);
                              },
                            )
                            ).then((value) {
                              print('Callback executed ' + value.toString());

                              if(value == true){
                                widget.tabController.animateToPage(3, duration: const Duration(milliseconds: 700), curve: Curves.easeOut);
                              }
//                              setState(() {
//
//                              });
                            }
                          ),//widget.tabController.jumpToPage(1), //print('PRESSED'),
                          color: Colors.indigoAccent,
                          child: Text('Submit Pup'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      )
    );
  }
}

//class Home extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) => new Container(
//    child: new Column(
//      crossAxisAlignment: CrossAxisAlignment.center,
//      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//      children: <Widget>[
//        new Icon(
//          Icons.home,
//          size: 150.0,
//          color: Colors.black12
//        ),
//        new Text('test tab content')
//      ],
//    )
//  );
//}