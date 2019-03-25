import 'package:flutter/material.dart';
import 'package:flutter_starter/widgets/icon_menu_row.dart';
import 'package:flutter_starter/widgets/label_below_icon.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_starter/scope_model/user.dart';

class MenuModal {

   var user = User();
    var page = "";

   MenuModal({this.page});

  mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
//          ScopedModelDescendant<User>(
//            builder: (context, child, user) => Text(
//              '${user.currentPage}',
//            ),
//          );
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: new Container(
                  height: 80.0,
                  child:   Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
//                          child: Text(
//                              page
//                            ),
//                        child:  ScopedModelDescendant<User>(
//                            builder: (context, child, user) => Text(
//                              '${user.currentPage}',
//                            ),
//                          )

                        child: Row(
                          // This next line does the trick.
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: ListMyWidgets(context, page)
                        )


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

List<LabelBelowIcon> ListMyWidgets(context, page) {

  List<LabelBelowIcon> list = new List();
  List<BottomMenuItem> bottomMenuItems = BottomMenuItems.where((i) => i.page == page).toList();

  bottomMenuItems.forEach((item) =>
      list.add(
       new LabelBelowIcon(
        icon: item.icon,
        label: item.link,
        circleColor: Colors.blue,
        )
      )
  );

//  for (var i = 0; i < 4; i++){
//    list.add(
//       new LabelBelowIcon(
//        icon: Icons.access_time,
//        label: page,
//        circleColor: Colors.blue,
//        )
//      );
//  }
  return list;
}


class BottomMenuItem{
  final String link;
  final IconData icon;
  final String page;

  const BottomMenuItem({this.link, this.icon, this.page});

}

const List<BottomMenuItem> BottomMenuItems = const <BottomMenuItem> [
  const BottomMenuItem(link: "dlink 1", icon: Icons.dashboard, page: "Dashboard"),
  const BottomMenuItem(link: "dlink 2", icon: Icons.dashboard, page: "Dashboard"),
  const BottomMenuItem(link: "dlink 3", icon: Icons.dashboard, page: "Dashboard"),
  const BottomMenuItem(link: "dlink 4", icon: Icons.dashboard, page: "Dashboard"),
  const BottomMenuItem(link: "alink 1", icon: Icons.timeline, page: "Activities"),
  const BottomMenuItem(link: "alink 2", icon: Icons.timeline, page: "Activities"),
  const BottomMenuItem(link: "alink 3", icon: Icons.timeline, page: "Activities"),
  const BottomMenuItem(link: "alink 4", icon: Icons.timeline, page: "Activities"),
  const BottomMenuItem(link: "ilink 1", icon: Icons.wb_incandescent, page: "Insights"),
  const BottomMenuItem(link: "ilink 2", icon: Icons.wb_incandescent, page: "Insights"),
  const BottomMenuItem(link: "ilink 3", icon: Icons.wb_incandescent, page: "Insights"),
  const BottomMenuItem(link: "ilink 4", icon: Icons.wb_incandescent, page: "Insights"),
  const BottomMenuItem(link: "clink 1", icon: Icons.group, page: "Contacts"),
  const BottomMenuItem(link: "clink 2", icon: Icons.group, page: "Contacts"),
  const BottomMenuItem(link: "clink 3", icon: Icons.group, page: "Contacts"),
  const BottomMenuItem(link: "clink 4", icon: Icons.group, page: "Contacts"),
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


