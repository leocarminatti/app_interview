import 'package:flutter_contacts/flutter_contacts.dart';

class ContactsService {
  static late List<Contact> contacts;

  static Future<void> init() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts();
    }
  }

  static bool comparerContact(String name) {
    return contacts.any((e) => e.displayName.contains(name));
  }
}
