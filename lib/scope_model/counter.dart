import 'package:scoped_model/scoped_model.dart';

class Counter extends Model {
  int value = 20;

  void counterIncrement() {
    value += 1;
    notifyListeners();
  }
}