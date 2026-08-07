import 'package:flutter/material.dart';

class ContactListScreen extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {'name': 'reduanul', 'phone': '01790-853814'},
    {'name': 'islam', 'phone': '01815-268795'},
    {'name': 'Hasan', 'phone': '01900-000000'},
    {'name': 'shams', 'phone': '01900-0000000'},
    {'name': 'phalowan', 'phone': '01900-00000000'},
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
        backgroundColor: Color(0xFF607D8B),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'reduanul',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                hintText: '01790-853814',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF607D8B),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                ),
                child: Text('Add'),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey[100],
                    margin: EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      leading: Icon(Icons.person, size: 40, color: Colors.brown[300]),
                      title: Text(
                        contacts[index]['name']!,
                        style: TextStyle(color: Colors.red[400], fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(contacts[index]['phone']!),
                      trailing: Icon(Icons.phone, color: Colors.blue),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}