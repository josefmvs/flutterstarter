import 'dart:async';

import 'package:flutter_starter/bloc_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_starter/repository/db.dart';


class SupportBloc implements BlocBase{
  SupportBloc(){
    db.init().listen((data) => _inFirestore.add(data));
  }

  String id;
  final _idController = StreamController<String>();
  Stream<String> get outId => _idController.stream;
  Sink<String> get _inId => _idController.sink;

  final _firestoreController = StreamController<QuerySnapshot>();
  Stream<QuerySnapshot> get outFirestore => _firestoreController.stream;
  Sink<QuerySnapshot> get _inFirestore => _firestoreController.sink;

  void readData() async {
    db.readData(id);
  }

  void updateData(DocumentSnapshot doc) {
    db.updateData(doc);
  }

  void deleteData(DocumentSnapshot doc) async {
    db.deleteData(doc);
    id = null;
    _inId.add(null);
  }

  void createData(String name) async {
    String id = await db.createData(name + " test!xx");
    this.id = id;
    _inId.add(this.id);
  }

  @override
  void dispose() {
    _firestoreController.close();
    _idController.close();
  }
}