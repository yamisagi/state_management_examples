import 'package:flutter/material.dart';
import 'package:state_management_examples/materials/stateful_app/service/mock_api.dart';
import 'package:uuid/uuid.dart';

class MockProvider extends InheritedWidget {
  final MockApi mockApi;
  final String uuid;

  MockProvider({
    Key? key,
    required Widget child,
    required this.mockApi,
  })  : uuid = const Uuid().v4(),
        super(key: key, child: child);

  // Of metodunu kullanarak bu widget'ın context'inden ulaşabiliriz.
  // dependOnInheritedWidgetOfExactType metodunu kullanarak bu widget'ın state'ini 

  static MockProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MockProvider>()!;
  }

  @override
  bool updateShouldNotify(covariant MockProvider oldWidget) {
    // Bu widget'ın state'ini değiştirmek için true döndürür.

    return uuid != oldWidget.uuid;
  }
}
