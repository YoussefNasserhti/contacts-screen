import 'package:flutter/material.dart';
import '../services/contact_service.dart';
import '../widgets/contact_item.dart';

class ContactsScreen extends StatefulWidget {
  final ContactService contactService;

  ContactsScreen({required this.contactService});

  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  void _addContact() {
    if (_nameController.text.isNotEmpty && _phoneController.text.isNotEmpty) {
      setState(() {
        widget.contactService.addContact(_nameController.text, _phoneController.text);
        _nameController.clear();
        _phoneController.clear();
      });
    }
  }

  void _deleteContact() {
    setState(() {
      widget.contactService.deleteLastContact();
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts Screen'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[600],
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Enter Your Name Here',
                hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                suffixIcon: Icon(Icons.edit),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Enter Your Number Here',
                hintStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                suffixIcon: Icon(Icons.phone),
              ),
              keyboardType: TextInputType.phone,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _addContact,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    minimumSize: Size(150, 50),
                  ),
                  child: Text('Add', style: TextStyle(fontSize: 20)),
                ),
                ElevatedButton(
                  onPressed: _deleteContact,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    minimumSize: Size(150, 50),
                  ),
                  child: Text('Delete', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: widget.contactService.contacts
                  .map((contact) => ContactItem(
                name: contact.name,
                phone: contact.phone,
              ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
