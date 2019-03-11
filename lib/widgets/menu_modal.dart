import 'package:flutter/material.dart';

class MenuModal {
  mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.only(bottom: 50.0) ,
            child: Wrap(
              children: [
                MenuItem(title: 'Dashboard', icon: Icons.dashboard),
                MenuItem(title: 'Activities', icon: Icons.timeline),
                MenuItem(title: 'Insights', icon: Icons.wb_incandescent),
                MenuItem(title: 'Contacts', icon: Icons.group)
              ].map((MenuItem item) => Chip(
                avatar: CircleAvatar(child: Text(item.title.substring(0, 1))),
                label: Text(item.title),
              )).toList(),
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


