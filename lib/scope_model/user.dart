import 'package:scoped_model/scoped_model.dart';

class User extends Model {
  int value = 0;

  void increment() {
    value += 1;
    notifyListeners();
  }

  void setValue(int val){
    value = val;
  }

}