import 'dart:async';
import 'package:flutter_starter/bloc_provider.dart';

class AppBloc implements BlocBase{
  AppBloc();

  String appName;
  final _appController = StreamController<String>();
  Stream<String> get outAppName => _appController.stream.asBroadcastStream();
  Sink<String> get _inAppName => _appController.sink;

//  void readData() async {
//    db.readData(id);
//  }
//
//  void updateData(DocumentSnapshot doc) {
//    db.updateData(doc);
//  }
//
//  void deleteData(DocumentSnapshot doc) async {
//    db.deleteData(doc);
//    id = null;
//    _inId.add(null);
//  }
//
//  void createData(String name) async {
//    String id = await db.createData(name + " test!xx");
//    this.id = id;
//    _inId.add(this.id);
//  }

  @override
  void dispose() {
    _appController.close();
  }
}