import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_starter/bloc_provider.dart';
import 'package:flutter_starter/screens/support_bloc.dart';
import 'package:flutter_starter/widgets/animated_fab.dart';
import './tabs/dashboard.dart' as _firstTab;
import './tabs/settings.dart' as _secondTab;
import './tabs/home.dart' as _thirdTab;
import './tabs/contacts.dart' as _fourthTab;
import './screens/about.dart' as _aboutPage;
import './screens/support.dart' as _supportPage;

void main() => runApp(
//    BlocProvider(
//  bloc: SupportBloc(),
//  child:
  new MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Flutter Starter',
  theme: new ThemeData(
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.green, backgroundColor: Colors.red
  ),
   home: new Tabs(),
  onGenerateRoute: (RouteSettings settings) {
    switch (settings.name) {
      case '/about': return new FromRightToLeft(
        builder: (_) => new _aboutPage.About(),
        settings: settings,
      );
      case '/support': return new FromRightToLeft(
        builder: (_) =>
          BlocProvider(
            bloc: SupportBloc(),
            child: new _supportPage.Support()
          ),
        settings: settings,
      );
    }
  },
  )
  // routes: <String, WidgetBuilder> {
  //   '/about': (BuildContext context) => new _aboutPage.About(),
  // }
//)
);

class FromRightToLeft<T> extends MaterialPageRoute<T> {
  FromRightToLeft({ WidgetBuilder builder, RouteSettings settings })
    : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {

    if (settings.isInitialRoute)
      return child;

    return new SlideTransition(
      child: new Container(
        decoration: new BoxDecoration(
          boxShadow: [
            new BoxShadow(
              color: Colors.black26,
              blurRadius: 25.0,
            )
          ]
        ),
        child: child,
      ),
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: Offset.zero,
      )
      .animate(
        new CurvedAnimation(
          parent: animation,
          curve: Curves.fastOutSlowIn,
        )
      ),
    );
  }
  @override Duration get transitionDuration => const Duration(milliseconds: 400);
}

class Tabs extends StatefulWidget {
  @override
  TabsState createState() => new TabsState();
}

class TabsState extends State<Tabs> {
  final double _imageHeight = 256.0;
  PageController _tabController;

  var _title_app = null;
  int _tab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new PageController();
    this._title_app = TabItems[0].title;
  }

  @override
  void dispose(){
    super.dispose();
    _tabController.dispose();
  }

//  Widget _buildFab() {
//    return new Positioned(
//        //top: 30,
//        right: -40.0,
//        bottom: -20.0,
//        child:
//          //onClick: _changeFilterState,
//        ));
//  }

  Widget _buildFab() {
    return new Positioned(
      bottom: 0.0,
      right:  -50.0,
      child: new AnimatedFab()
    );
  }

  @override
  Widget build (BuildContext context) => new Scaffold(

    //App Bar
    appBar: new AppBar(
      title: new Text(
        _title_app, 
        style: new TextStyle(
          fontSize: Theme.of(context).platform == TargetPlatform.iOS ? 17.0 : 20.0,
        ),
      ),
      elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
    ),
      body: new Stack(
        children: <Widget>[
          new PageView(
            controller: _tabController,
            onPageChanged: onTabChanged,
            children: <Widget>[
              new _firstTab.Dashboard(),
              new _secondTab.Settings(),
              new _thirdTab.Home(),
              new _fourthTab.Contacts()
            ],
          ),
          _buildFab(),
        ],
      ),


    //Tabs
    bottomNavigationBar: Theme.of(context).platform == TargetPlatform.iOS ?
      new CupertinoTabBar(
        activeColor: Colors.blueGrey,
        currentIndex: _tab,
        onTap: onTap,
        items: TabItems.map((TabItem) {
          return new BottomNavigationBarItem(
            title: new Text(TabItem.title),
            icon:   new Icon(TabItem.icon, size: 15),
          );
        }).toList(),
      ):
      new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _tab,
        onTap: onTap,
        items: TabItems.map((TabItem) {
          return new BottomNavigationBarItem(
          title: new Text(TabItem.title),
          icon:   new Icon(TabItem.icon, size: 20),
          );
        }).toList(),
    ),
   // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    //Drawer
    drawer: new Drawer(
      child: new ListView(
        children: <Widget>[
          new Container(
            height: 120.0,
            child: new DrawerHeader(
              padding: new EdgeInsets.all(0.0),
              decoration: new BoxDecoration(
                color: new Color(0xFFECEFF1),
              ),
              child: new Center(
                child: new FlutterLogo(
                  colors: Colors.blueGrey,
                  size: 54.0,
                ),
              ),
            ),
          ),
          new ListTile(
            leading: new Icon(Icons.chat),
            title: new Text('Support'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/support');
            }
          ),
          new ListTile(
            leading: new Icon(Icons.info),
            title: new Text('About'),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/about');
            }
          ),
          new Divider(),
          new ListTile(
            leading: new Icon(Icons.exit_to_app),
            title: new Text('Sign Out'),
            onTap: () {
              Navigator.pop(context);
            }
          ),
        ],
      )
    )
  );

  void onTap(int tab){
    _tabController.jumpToPage(tab);
  }

  void onTabChanged(int tab) {
    setState((){
      this._tab = tab;
    });

    switch (tab) {
      case 0:
        this._title_app = TabItems[0].title;
      break;

      case 1:
        this._title_app = TabItems[1].title;
      break;

      case 2:
        this._title_app = TabItems[2].title;
      break;

      case 3:
        this._title_app = TabItems[3].title;
        break;


    }
  }
}

class TabItem {
  const TabItem({ this.title, this.icon });
  final String title;
  final IconData icon;
}

const List<TabItem> TabItems = const <TabItem>[

  const TabItem(title: 'Dashboard', icon: Icons.dashboard),
  const TabItem(title: 'Activities', icon: Icons.timeline),
  const TabItem(title: 'Insights', icon: Icons.wb_incandescent),
  const TabItem(title: 'Contacts', icon: Icons.group)
];