import 'package:scoped_model/scoped_model.dart';

class User extends Model {
  int value = 10;
  String currentPage = "";

  void increment() {
    value += 1;
    notifyListeners();
  }

  void setValue(int val){
    value = value + val;
  }

  void setPage(String page){
    currentPage = page;
    print("set page :" + currentPage);
  }

}