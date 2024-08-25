import 'package:flutter/material.dart';
import 'screens/contacts_screen.dart';
import 'services/contact_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactsScreen(contactService: ContactService()),
    );
  }
}
