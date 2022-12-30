import 'package:uuid/uuid.dart';

class BreadCrumbModel {
  bool isActive;
  final String title;
  final String uuid;

  BreadCrumbModel({
    required this.isActive,
    required this.title,
  })  : uuid = const Uuid().v4(),
        assert(title.isNotEmpty, 'Title cannot be empty');

  @override
  bool operator ==(covariant BreadCrumbModel other) => uuid == other.uuid;

  @override
  int get hashCode => uuid.hashCode;

  String get name => title + (isActive ? ' > ' : '');

  void setActive() {
    isActive = true;
  }
}
