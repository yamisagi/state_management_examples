import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:state_management_examples/materials/provider_examples/basic_example/model/bread_crumb_model.dart';

class BreadCrumbNotifier extends ChangeNotifier {
  // BreadCrumb'ları tutan liste olarak kullanacağız.

  final List<BreadCrumbModel> _breadCrumbList = [];

  // BreadCrumb'ları döndüren getter.

  UnmodifiableListView<BreadCrumbModel> //
      get breadCrumbList => UnmodifiableListView(_breadCrumbList);

  // BreadCrumb'ları ekleyen metot.

  void addBreadCrumb(BreadCrumbModel breadCrumb) {
    for (final element in _breadCrumbList) {
      element.setActive();
    }
    _breadCrumbList.add(breadCrumb);
    // Bizi dinleyen listener'lara değişiklik bildiriyoruz.
    notifyListeners();
  }

  // BreadCrumb'ları temizleyen metot.

  void clearBreadCrumb() {
    _breadCrumbList.clear();
    // Bizi dinleyen listener'lara değişiklik bildiriyoruz.
    notifyListeners();
  }
}
