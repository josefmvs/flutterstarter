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
import './widgets/menu_modal.dart';
import 'package:scoped_model/scoped_model.dart';
import './scope_model/user.dart';
import 'package:flutter_starter/scope_model/counter.dart';
import 'dart:async';

void main() {
  // Wrap your App in your new storage container
  runApp(new MyApp()
  );
}

class MyApp extends StatelessWidget {
  static final _myTabbedPageKey = new GlobalKey<TabsState>();
  String title = 'MeSuite';
  var user = User();
  var counter = Counter();

  @override
  Widget build(BuildContext context) {

//    Timer.periodic(
//      const Duration(seconds: 5),
//          (timer) => user.increment(),
//    );

    Timer.periodic(
      const Duration(seconds: 3),
          (timer) => counter.counterIncrement(),
    );

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Starter',
      theme: new ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Color.fromARGB(255, 40, 199, 143), backgroundColor: Colors.red
      ),
      home: ScopedModel<User>(
          model: user,
          child: new Tabs(
            key: _myTabbedPageKey,
      )),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/about': return new FromRightToLeft(
            builder: (_) => ScopedModel<Counter>(
              model: counter,
              child: ScopedModel<User>(
                model: user,
                child: new _aboutPage.About(),
                ),
            ),
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
//      initialRoute: '/',
//      routes: {
//        // When we navigate to the "/" route, build the FirstScreen Widget
//        '/': (context) => FirstScreen(),
//        // When we navigate to the "/second" route, build the SecondScreen Widget
//        '/second': (context) => SecondScreen(),
//      },
    );

  }
}

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
  const Tabs({Key key}) : super(key: key);

  @override
  TabsState createState() => new TabsState();
}

class TabsState extends State<Tabs> {
  final double _imageHeight = 256.0;
  PageController _tabController;
  var user = User();
  var _title_app = null;
  int _tab = 0;
  var defaultPage = "Dashboard";

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

  Widget _buildFab() {
    return new Positioned(
      bottom: 0.0,
      right:  -50.0,
      child: new AnimatedFab()
    );
  }

  @override
  Widget build (BuildContext context) {

    var page = ScopedModel.of<User>(context).currentPage;  //ScopedModel.of<User>(context).currentPage ? "" : this.defaultPage;

    if(page == ""){
      page = defaultPage;
    }

    MenuModal menuModal = new MenuModal(page: page);

    return new Scaffold(
      //App Bar
        appBar: new AppBar(
          title: new Text(
            _title_app,
            style: new TextStyle(
              color: Colors.white,
              fontSize: Theme.of(context).platform == TargetPlatform.iOS ? 17.0 : 20.0,
            ),
          ),
          elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
          iconTheme: new IconThemeData(color: Colors.white),
        ),
        body: new Stack(
          children: <Widget>[
            new PageView(
              controller: _tabController,
              onPageChanged: onTabChanged,
              children: <Widget>[
                new _firstTab.Dashboard(),
                new _secondTab.Settings(),
                new _thirdTab.Home(tabController: _tabController),
                new _fourthTab.Contacts()
              ],
            ),
//          _buildFab(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => menuModal.mainBottomSheet(context),
          elevation: 0.0,
          tooltip: 'Increment Counter',
          child: Icon(Icons.add),
          backgroundColor: Colors.yellow[600],

        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
        ): new BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Color.fromARGB(255, 40, 199, 143),
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(padding: EdgeInsets.only(left: 20.0), highlightColor: Colors.black, color: Colors.white, icon: Icon(Icons.dashboard), onPressed: () { onTap(0); },),
              IconButton(highlightColor: Colors.black,color: Colors.white,icon: Icon(Icons.timeline), onPressed: () { onTap(1); },),
              SizedBox(width: 50.0),
              IconButton(highlightColor: Colors.black,color: Colors.white,icon: Icon(Icons.wb_incandescent), onPressed: () { onTap(2); },),
              IconButton(padding: EdgeInsets.only(right: 20.0), highlightColor: Colors.black, color: Colors.white, icon: Icon(Icons.group), onPressed: () { onTap(3); },),

            ],
          ),
        ),

//    const TabItem(title: 'Dashboard', icon: Icons.dashboard),
//    const TabItem(title: 'Activities', icon: Icons.timeline),
//    const TabItem(title: 'Insights', icon: Icons.wb_incandescent),
//    const TabItem(title: 'Contacts', icon: Icons.group)

//      new Theme(
//        data: Theme.of(context).copyWith(
//          // sets the background color of the `BottomNavigationBar`
//            canvasColor: Color.fromARGB(255, 40, 199, 143),
//            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
//            primaryColor: Colors.yellow[600],// Color.fromARGB(200, 254, 183, 0),
//            textTheme: Theme
//                .of(context)
//                .textTheme
//                .copyWith(caption: new TextStyle(color: Colors.white))), // sets the inactive color of the `BottomNavigationBar`
//        child: new BottomNavigationBar(
//          type: BottomNavigationBarType.fixed,
//          currentIndex: _tab,
//          onTap: onTap,
//          items: TabItems.map((TabItem) {
//            return new BottomNavigationBarItem(
//              title: new Text(TabItem.title),
//              icon:   new Icon(TabItem.icon, size: 20),
//            );
//          }).toList(),
//        ),
//      ),

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
  }

  void onTap(int tab){
    _tabController.jumpToPage(tab);
  }

  void onTabChanged(int tab) {
    setState((){
      this._tab = tab;
    });



   // var user = User();
    switch (tab) {
      case 0:
        {
          ScopedModel.of<User>(context).setPage("Dashboard");

          this._title_app = TabItems[0].title;
          break;
        }
      case 1:
        {
          ScopedModel.of<User>(context).setPage("Activities");
         // user.setPage("Activities");
          this._title_app = TabItems[1].title;
          break;
        }
      case 2:
        {
          ScopedModel.of<User>(context).setPage("Insights");

          this._title_app = TabItems[2].title;
          break;
        }
      case 3:
        {
         ScopedModel.of<User>(context).setPage("Contacts");
          this._title_app = TabItems[3].title;
          break;
        }

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