// ignore_for_file: public_member_api_docs, sort_constructors_first
// Üç farklı widget için bir base class oluşturuyoruz.

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:state_management_examples/materials/provider_examples/deep_example/objects/cheap_object.dart';
import 'package:state_management_examples/materials/provider_examples/deep_example/objects/expensive_object.dart';
import 'package:uuid/uuid.dart';

// ObjectProvider sınıfı, ChangeNotifier sınıfından türettiğimiz içerisinde BaseObject'ten türetilmiş
// CheapObject ve ExpensiveObject sınıflarının değerlerini içeren bir sınıf olarak düşünebiliriz.
// Bu sınıf içerisindeki değişkenlerin değerlerini değiştirdiğimizde, bu değişikliklerin tüm dinleyici widget'lar tarafından,
// notifyListeners() metodu çağrıldığında algılanması için ChangeNotifier sınıfından türetildiğini unutmayalım.

class ObjectProvider extends ChangeNotifier {
  /// id değişkeni, bu sınıfın bir örneğinin oluşturulduğu anın tarih ve saati ile birlikte
  /// rastgele bir UUID değeri ile birlikte oluşturuluyor.
  /// [BaseObject] sınıfından türetilen [CheapObject] ve [ExpensiveObject] sınıflarının referanslarını tutuyor.

  late String id;

  /// [CheapObject] sınıfından türetilen bir nesne oluşturuyoruz. Ve her constructor çağrıldığında bu nesnenin değeri değişiyor.

  late CheapObject cheapObject;
  late Color cheapObjectColor;
  late Color expensiveObjectColor;

  /// [ExpensiveObject] sınıfından türetilen bir nesne oluşturuyoruz. Ve her constructor çağrıldığında bu nesnenin değeri değişiyor.
  late ExpensiveObject expensiveObject;

  /// [StreamSubscription] sınıfından türetilen iki nesne oluşturuyoruz. Bu nesneler, [CheapObject] ve [ExpensiveObject] sınıfları için
  /// Periodik olarak değerlerini değiştirmek için kullanılacak.

  late StreamSubscription _cheapObjectSubscription;
  late StreamSubscription _expensiveObjectSubscription;

  final List<Color> _colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.cyan,
    Colors.lime,
    Colors.indigo,
    Colors.brown,
    Colors.grey,
    Colors.amber,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.limeAccent,
    Colors.blueGrey,
  ];

  ObjectProvider() {
    id = const Uuid().v4();
    cheapObject = CheapObject();
    expensiveObject = ExpensiveObject();
    cheapObjectColor = _colors[0];
    expensiveObjectColor = _colors[1];
    start();
  }

  CheapObject get cheapObjectValue => cheapObject;
  ExpensiveObject get expensiveObjectValue => expensiveObject;
  @override
  void notifyListeners() {
    id = const Uuid().v4();
    super.notifyListeners();
  }

  /// [start] metodu, [CheapObject] ve [ExpensiveObject] sınıflarının değerlerini değiştirmek için kullanılacak olan
  /// [Stream] nesnelerini oluşturuyor.
  /// Bu nesnelerin değerlerini değiştirmek için kullanılacak olan [StreamSubscription] nesnelerini de oluşturuyor.

  void start() {
    _cheapObjectSubscription =
        Stream.periodic(const Duration(seconds: 1)).listen((_) {
      cheapObject = CheapObject();

      /// [Random] sınıfından türetilen bir nesne oluşturuyoruz. Bu nesne ile [_colors] listesinden
      /// rastgele bir renk değeri seçiyoruz.
      cheapObjectColor = _colors[Random().nextInt(_colors.length)];
      notifyListeners();
    });

    _expensiveObjectSubscription =
        Stream.periodic(const Duration(seconds: 5)).listen((_) {
      expensiveObject = ExpensiveObject();

      /// [Random] sınıfından türetilen bir nesne oluşturuyoruz. Bu nesne ile [_colors] listesinden
      /// rastgele bir renk değeri seçiyoruz.
      expensiveObjectColor = _colors[Random().nextInt(_colors.length)];
      notifyListeners();
    });
  }

  /// [stop] metodu, [CheapObject] ve [ExpensiveObject] [StreamSubscription] nesnelerini iptal ediyor.
  void stop() {
    _cheapObjectSubscription.cancel();
    _expensiveObjectSubscription.cancel();
  }
}
