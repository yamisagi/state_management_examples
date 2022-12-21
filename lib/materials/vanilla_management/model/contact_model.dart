// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:uuid/uuid.dart';

class Contact {
  final String name;
  final String id;
  Contact({
    required this.name,
  }) : id = const Uuid().v4();
}
