import 'package:flutter/cupertino.dart';
import 'package:state_management_examples/materials/vanilla_management/model/contact_model.dart';

class ContactBook extends ValueNotifier<List<Contact>> {
  ContactBook._internal() : super(<Contact>[]);

  static final ContactBook _singleton = ContactBook._internal();
  factory ContactBook() => _singleton;


  int get contactsCount => value.length;

  void addContact(Contact contact) {
    value.add(contact);
    notifyListeners();
  }

  void removeContact(Contact contact) {
    value.remove(contact);
    notifyListeners();
  }

  Contact? getContact(int index) {
    if (index < 0 || index >= value.length) return null;
    return value[index];
  }
}
