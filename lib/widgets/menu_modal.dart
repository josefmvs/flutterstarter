import 'package:flutter/material.dart';
import 'package:flutter_starter/widgets/icon_menu_row.dart';
import 'package:flutter_starter/widgets/label_below_icon.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_starter/scope_model/user.dart';

class MenuModal {

  var user = User();

  mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
//          return Container(
//            height: 250.0,
//            child:   Column(
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: <Widget>[ IconMenuRow(
//                  firstIcon: Icons.ac_unit,
//                  firstLabel: "Friends",
//                  firstIconCircleColor: Colors.blue,
//                  secondIcon: Icons.map,
//                  secondLabel: "Groups",
//                  secondIconCircleColor: Colors.orange,
//                  thirdIcon: Icons.movie,
//                  thirdLabel: "Nearby",
//                  thirdIconCircleColor: Colors.purple,
//                  fourthIcon: Icons.refresh,
//                  fourthLabel: "Moment",
//                  fourthIconCircleColor: Colors.indigo,
//                ),
//                IconMenuRow(
//                  firstIcon: Icons.ac_unit,
//                  firstLabel: "Friends",
//                  firstIconCircleColor: Colors.blue,
//                  secondIcon: Icons.map,
//                  secondLabel: "Groups",
//                  secondIconCircleColor: Colors.orange,
//                  thirdIcon: Icons.movie,
//                  thirdLabel: "Nearby",
//                  thirdIconCircleColor: Colors.purple,
//                  fourthIcon: Icons.refresh,
//                  fourthLabel: "Moment",
//                  fourthIconCircleColor: Colors.indigo,
//                ),
//                ]
//            )
//
//          );

          //return Text("Josef Solon");
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: new Container(
                  height: 80.0,
                  child:   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: ScopedModel<User>(
                        model: user,
                        child: Row(
                          // This next line does the trick.
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: ListMyWidgets(user)
                        )
                      )

//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                        children: <Widget>[
//                          IconMenuRow(
//                            firstIcon: Icons.ac_unit,
//                            firstLabel: "Friends",
//                            firstIconCircleColor: Colors.blue,
//                            secondIcon: Icons.map,
//                            secondLabel: "Groups",
//                            secondIconCircleColor: Colors.orange,
//                            thirdIcon: Icons.movie,
//                            thirdLabel: "Nearby",
//                            thirdIconCircleColor: Colors.purple,
//                            fourthIcon: Icons.refresh,
//                            fourthLabel: "Moment",
//                            fourthIconCircleColor: Colors.indigo,
//                          ),
//                        ],
//                      ),
                    ),
                  ),
                ),

          );
        }
    );
  }
}

//child: new Column(
//crossAxisAlignment: CrossAxisAlignment.stretch,
//children: ListMyWidgets()),
//

List<LabelBelowIcon> ListMyWidgets(User user) {
  List<LabelBelowIcon> list = new List();

  for (var i = 0; i < 4; i++){
    list.add(
       new LabelBelowIcon(
        icon: Icons.access_time,
        label: user.currentPage,
        circleColor: Colors.blue,
        )
      );
  }
  return list;
//  list.add(
//   new LabelBelowIcon(
//    icon: Icons.access_time,
//    label: "Test",
//    circleColor: Colors.blue,
//    )
//  );
//  list.add(
//      new LabelBelowIcon(
//      icon: Icons.access_time,
//      label: "Test 2",
//      circleColor: Colors.blue,
//      )
//    );
//  list.add(
//    new LabelBelowIcon(
//    icon: Icons.access_time,
//    label: "Test 3",
//    circleColor: Colors.blue,
//    )
//  );
//  return list;
}


class BottomMenuItem{
  final String link;
  final IconData icon;
  final String page;

  const BottomMenuItem({this.link, this.icon, this.page});

}

const List<BottomMenuItem> BottomMenuItems = const <BottomMenuItem> [

  const BottomMenuItem(link: "link 1", icon: Icons.dashboard, page: "dashboard"),
  const BottomMenuItem(link: "link 2", icon: Icons.dashboard, page: "dashboard"),
  const BottomMenuItem(link: "link 3", icon: Icons.dashboard, page: "dashboard"),
  const BottomMenuItem(link: "link 4", icon: Icons.dashboard, page: "dashboard"),
  const BottomMenuItem(link: "link 1", icon: Icons.timeline, page: "activities"),
  const BottomMenuItem(link: "link 2", icon: Icons.timeline, page: "activities"),
  const BottomMenuItem(link: "link 3", icon: Icons.timeline, page: "activities"),
  const BottomMenuItem(link: "link 4", icon: Icons.timeline, page: "activities"),
  const BottomMenuItem(link: "link 1", icon: Icons.wb_incandescent, page: "insights"),
  const BottomMenuItem(link: "link 2", icon: Icons.wb_incandescent, page: "insights"),
  const BottomMenuItem(link: "link 3", icon: Icons.wb_incandescent, page: "insights"),
  const BottomMenuItem(link: "link 4", icon: Icons.wb_incandescent, page: "insights"),
  const BottomMenuItem(link: "link 1", icon: Icons.group, page: "contacts"),
  const BottomMenuItem(link: "link 2", icon: Icons.group, page: "contacts"),
  const BottomMenuItem(link: "link 3", icon: Icons.group, page: "contacts"),
  const BottomMenuItem(link: "link 4", icon: Icons.group, page: "contacts"),
];


class MenuItem {
  const MenuItem({ this.title, this.icon });
  final String title;
  final IconData icon;
}

const List<MenuItem> TabItems = const <MenuItem>[

  const MenuItem(title: 'Dashboard', icon: Icons.dashboard),
  const MenuItem(title: 'Activities', icon: Icons.timeline),
  const MenuItem(title: 'Insights', icon: Icons.wb_incandescent),
  const MenuItem(title: 'Contacts', icon: Icons.group)
];


