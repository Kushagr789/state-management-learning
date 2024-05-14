import 'package:flutter/foundation.dart';

class FavouriteItem with ChangeNotifier{
  List<int> _selected=[];
  List<int> get selected=>_selected;

  void addItem(int value){
    _selected.add(value);
    notifyListeners();
  }
  void removeItem(int value){
    _selected.remove(value);
    notifyListeners();
  }
}