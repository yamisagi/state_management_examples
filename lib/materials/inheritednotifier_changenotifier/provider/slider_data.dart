import 'dart:developer';

import 'package:flutter/material.dart';

// InheritedNotifier'ın notifier parametresi ChangeNotifier'dan türemelidir. 
// Bu yüzden SliderData class'ı ChangeNotifier'dan türetilir.

class SliderData extends ChangeNotifier {
  double _value = 0.0;

  double get value => _value;

  set value(double newValue) {
    log('Triggered SliderData.value notifier');
    _value = newValue;
    notifyListeners();
  }
}
