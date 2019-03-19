import 'package:flutter/material.dart';
import 'package:flutter_starter/widgets/icon_menu_row.dart';

//class MenuModal {
//  mainBottomSheet(BuildContext context) {
//    showModalBottomSheet(
//        context: context,
//        builder: (BuildContext context) {
//          return Container(
//            padding: EdgeInsets.only(bottom: 50.0) ,
//            child: Wrap(
//              children: [
//                MenuItem(title: 'Dashboard', icon: Icons.dashboard),
//                MenuItem(title: 'Activities', icon: Icons.timeline),
//                MenuItem(title: 'Insights', icon: Icons.wb_incandescent),
//                MenuItem(title: 'Contacts', icon: Icons.group)
//              ].map((MenuItem item) => Chip(
//                avatar: CircleAvatar(child: Text(item.title.substring(0, 1))),
//                label: Text(item.title),
//              )).toList(),
//            ),
//          );
//
//        }
//    );
//  }
//}

class MenuModal {
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
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: new Container(
                  height: 80.0,
                  child:   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          IconMenuRow(
                            firstIcon: Icons.ac_unit,
                            firstLabel: "Friends",
                            firstIconCircleColor: Colors.blue,
                            secondIcon: Icons.map,
                            secondLabel: "Groups",
                            secondIconCircleColor: Colors.orange,
                            thirdIcon: Icons.movie,
                            thirdLabel: "Nearby",
                            thirdIconCircleColor: Colors.purple,
                            fourthIcon: Icons.refresh,
                            fourthLabel: "Moment",
                            fourthIconCircleColor: Colors.indigo,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

          );
        }
    );
  }
}

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


