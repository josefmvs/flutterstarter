import 'package:flutter_starter/model/app_state.dart';
import 'package:flutter_starter/reducers/counter_reducer.dart';

AppState appReducer(AppState state, action) {
  return new AppState(
    isLoading: false,
    count: counterReducer(state.count, action),
  );
}