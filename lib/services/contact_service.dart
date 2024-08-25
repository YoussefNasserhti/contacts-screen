import '../models/contact.dart';

class ContactService {
  final List<Contact> _contacts = [];

  List<Contact> get contacts => List.unmodifiable(_contacts);

  void addContact(String name, String phone) {
    if (_contacts.length < 3) {
      _contacts.add(Contact(name: name, phone: phone));
    }
  }

  void deleteLastContact() {
    if (_contacts.isNotEmpty) {
      _contacts.removeLast();
    }
  }
}
