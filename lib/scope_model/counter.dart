import 'package:scoped_model/scoped_model.dart';

class Counter extends Model {
  int value = 0;

  void counterIncrement() {
    value += 1;
    notifyListeners();
  }
}