import 'package:flutter/material.dart';
import 'package:state_management_examples/materials/vanilla_management/util/contact_book.dart';
import 'package:state_management_examples/materials/vanilla_management/view/new_contact_view.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContactBook contactBook = ContactBook();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewContactView()));
        },
        child: const Icon(Icons.add),
      ),
      body: ValueListenableBuilder(
        // ValueNotifier sınıfımız olan ContactBook sınıfını dinliyoruz. Bu sınıfın değeri değiştiğinde, builder metodu çalışacak.
        valueListenable: contactBook,
        builder: (context, value, child) => ListView.builder(
          itemCount: value.length,
          itemBuilder: (context, index) {
            final contact = value[index];
            return Dismissible(
              onDismissed: (direction) => contactBook.removeContact(contact),
              key: ValueKey(contact.id),
              child: ListTile(
                title: Text(contact.name),
              ),
            );
          },
        ),
      ),
    );
  }
}
