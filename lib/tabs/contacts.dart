import 'package:flutter/material.dart';
import '../model/lesson.dart';
import '../model/contact.dart';
import '../widgets/profile_tile.dart';
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
  var deviceSize;

  List contacts;
  List lessons;

  @override
  void initState() {
    lessons = getLessons();
    contacts = getContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    ListTile makeListTile(Contact contact) =>
        ListTile(
          contentPadding: const EdgeInsets.only(top: 10.0, bottom: 5.0),//EdgeInsets.symmetric(top: horizontal: 4.0, vertical: 4.0),
          leading: Container(
            padding: EdgeInsets.only(right: 5.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: CircleAvatar(
              foregroundColor: Colors.white,
              backgroundColor: Colors.grey,
              radius: 30.0,
              child: Text('AH'),
            ),
          ),
          title: Text(
            contact.firstName + " " + contact.lastName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            textAlign: TextAlign.start,
          ),
          subtitle: followColumn(deviceSize),
        );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => new Divider(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          return makeListTile(contacts[index]);
        },
      ),
    );

    return Scaffold(
      //backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: Container(
          margin: const EdgeInsets.only(left: 15.0, right: 15.0),
          //padding: const EdgeInsets.only(top: 5.0),
          child: makeBody
      ),
    );
  }


  Widget followColumn(Size deviceSize) => Container(
    //margin: const EdgeInsets.only(left: 0.0, right: 20.0),
    height: deviceSize.height * 0.05,
    child: Row(
     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//      crossAxisAlignment: CrossAxisAlignment.stretch,
//      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ProfileTile(
          title: "1.5K",
          subtitle: "Posts",
        ),
        ProfileTile(
          title: "2.5K",
          subtitle: "Followers",
        ),
        ProfileTile(
          title: "10K",
          subtitle: "Comments",
        ),
//        ProfileTile(
//          title: "1.2K",
//          subtitle: "Following",
//        )
      ],
    ),
  );


  List getContacts() {
    return [
      Contact(
        firstName: "Josef",
        lastName: "Solon",
        age: 35
      ),
      Contact(
        firstName: "Josef",
        lastName: "Solon",
        age: 35
      ),
      Contact(
        firstName: "Josef",
        lastName: "Solon",
        age: 35
      ),
      Contact(
        firstName: "Josef",
        lastName: "Solon",
        age: 35
      ),
      Contact(
        firstName: "Josef",
        lastName: "Solon",
        age: 35
      ),
      Contact(
          firstName: "Josef",
          lastName: "Solon",
          age: 35
      ),
      Contact(
          firstName: "Josef",
          lastName: "Solon",
          age: 35
      ),
      Contact(
          firstName: "Josef",
          lastName: "Solon",
          age: 35
      ),
      Contact(
          firstName: "Josef",
          lastName: "Solon",
          age: 35
      ),
      Contact(
          firstName: "Josef",
          lastName: "Solon",
          age: 35
      )
    ];
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