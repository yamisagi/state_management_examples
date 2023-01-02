import 'package:flutter/foundation.dart' show immutable;
import 'package:uuid/uuid.dart';

// Bir base class oluşturuyoruz.
// Bu class'ın içinde id ve lastUpdated değişkenleri olacak.
// Ve bundan türeyen class'lar bu değişkenleri kullanacak.

@immutable
class BaseObject {
  final String id;
  final String lastUpdated;

  BaseObject()
      : id = const Uuid().v4(),
        lastUpdated = DateTime.utc(
          DateTime.now().hour,
          DateTime.now().minute,
          DateTime.now().second,
        )
            .toIso8601String() //
            .substring(2, 10)
            .replaceAll('-', ':');

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BaseObject && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
