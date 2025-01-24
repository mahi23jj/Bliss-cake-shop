import 'package:flutter/foundation.dart';

class CategoryProvider extends ChangeNotifier {
  int _category = 0;

  int get category => _category;

  void updateCategory(int newCategory) {
    _category = newCategory;
    notifyListeners();
  }
  
}
