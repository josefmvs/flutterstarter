import 'package:flutter/material.dart';
import '../model/lesson.dart';
import '../model/contact.dart';
/// Note: continue with https://github.com/shubie/Beautiful-List-UI-and-detail-page/blob/master/lib/main.dart

class Contacts extends StatefulWidget {
  Contacts({Key key, this.title}) : super(key: key);

  final String title;

  @override
  ContactsState createState() {
    return ContactsState();
  }
}


class ContactsState extends State<Contacts> {
  final numItems = 20;
  final _biggerFont = const TextStyle(fontSize: 18.0);

  List contacts;
  List lessons;

  @override
  void initState() {
    lessons = getLessons();
    super.initState();
  }

//  @override
//  Widget build(BuildContext context) => new Container(
//      child: new Column(
//        crossAxisAlignment: CrossAxisAlignment.center,
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        children: <Widget>[
//          new Icon(
//              Icons.home,
//              size: 150.0,
//              color: Colors.black12
//          ),
//          new Text('Home tab content')
//        ],
//      )
//  );

//  List getContacts(){
//    return [
//      Contact(
//        firstName: "Josef",
//        lastName: "Solon",
//        age: 35,
//      ),
//      Contact(
//        firstName: "Daisy",
//        lastName: "Dano",
//        age: 35,
//      ),
//    ];
//  }

  @override
  Widget build(BuildContext context) {

    ListTile makeListTile(Lesson lesson) =>
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: CircleAvatar(
              backgroundColor: Colors.brown.shade800,
              radius: 30.0,
              child: Text('AH'),
            ),
          ),
          title: Text(
            lesson.title,
            //style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Text("Advanced")),
              Expanded(
                flex: 2,
                child: Text(lesson.level),
              )
            ],
          ),
        );

//    Card makeCard(Lesson lesson) =>
//        Card(
////          elevation: 8.0,
//          return makeCard(lessons[index]);
//        },
//      ),
//    );


    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: lessons.length,
        itemBuilder: (BuildContext context, int index) {
          return makeListTile(lessons[index]);
        },
      ),
    );

    return Scaffold(
      //backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: makeBody,
    );
  }

  List getLessons() {
    return [
      Lesson(
          title: "Introduction to Driving",
          level: "Beginner",
          indicatorValue: 0.33,
          price: 20,
          content:
          "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
      Lesson(
          title: "Observation at Junctions",
          level: "Beginner",
          indicatorValue: 0.33,
          price: 50,
          content:
          "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
      Lesson(
          title: "Reverse parallel Parking",
          level: "Intermidiate",
          indicatorValue: 0.66,
          price: 30,
          content:
          "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
      Lesson(
          title: "Reversing around the corner",
          level: "Intermidiate",
          indicatorValue: 0.66,
          price: 30,
          content:
          "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
      Lesson(
          title: "Incorrect Use of Signal",
          level: "Advanced",
          indicatorValue: 1.0,
          price: 50,
          content:
          "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
      Lesson(
          title: "Engine Challenges",
          level: "Advanced",
          indicatorValue: 1.0,
          price: 50,
          content:
          "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
      Lesson(
          title: "Self Driving Car",
          level: "Advanced",
          indicatorValue: 1.0,
          price: 50,
          content:
          "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.  "),
      Lesson(
          title: "Swift",
          level: "Advanced",
          indicatorValue: 1.0,
          price: 50,
          content:
          "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.  "),
      Lesson(
          title: "Josef Marion V Solon",
          level: "Advanced",
          indicatorValue: 1.0,
          price: 50,
          content:
          "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed.  "),

    ];
  }
}