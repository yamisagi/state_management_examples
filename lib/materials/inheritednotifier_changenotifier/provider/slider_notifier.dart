import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:state_management_examples/materials/inheritednotifier_changenotifier/provider/slider_data.dart';

// InheritedNotifier ile InheritedWidget arasındaki en büyük fark
// InheritedNotifier kendi data'sını tutmaz. Ve Listenable class'ından extend edildiği için bir notifier'a ihtiyaç vardır.

class SliderInheritedNotifier extends InheritedNotifier<SliderData> {
  const SliderInheritedNotifier({
    Key? key,
    required SliderData notifier,
    required Widget child,
  }) : super(
          key: key,
          // InheritedNotifier'ın notifier parametresi ChangeNotifier'dan türemelidir.
          // Ve super class'ın constructor'ında ChangeNotifier'ın notifyListeners() metodu çağrılır.
          notifier: notifier,
          child: child,
        );

  // 
  static double of(BuildContext context) {
    log('Triggered SliderInheritedNotifier.of()');
    return context
            .dependOnInheritedWidgetOfExactType //
            <SliderInheritedNotifier>()
            ?.notifier
            ?.value ??
        0.0;
  }
}
