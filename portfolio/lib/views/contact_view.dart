// lib/views/contact_view.dart
import 'package:flutter/material.dart';
import '../controllers/contact_controller.dart';

class ContactView extends StatelessWidget {
  final ContactController _controller = ContactController();

  @override
  Widget build(BuildContext context) {
    final contact = _controller.getContactInfo();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2E3192), Color(0xFF1BFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Custom AppBar with Back Button
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white, size: 28),
                    onPressed: () => _controller.navigateToHome(context),
                    tooltip: 'Back to Home',
                  ),
                  Row(
                    children: [
                      Text(
                        'Contact',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.5,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.contact_mail, color: Colors.white, size: 28),
                    ],
                  ),
                  SizedBox(width: 48), // Placeholder to balance layout
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white.withOpacity(0.95),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Get in Touch',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2E3192),
                          ),
                        ),
                        SizedBox(height: 16),
                        ListTile(
                          leading: Icon(Icons.email, color: Color(0xFF2E3192), size: 24),
                          title: Text(
                            'Email: ${contact.email}',
                            style: TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.phone, color: Color(0xFF2E3192), size: 24),
                          title: Text(
                            'Phone: ${contact.phone}',
                            style: TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.link, color: Color(0xFF2E3192), size: 24),
                          title: Text(
                            'LinkedIn: ${contact.linkedin}',
                            style: TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.code, color: Color(0xFF2E3192), size: 24),
                          title: Text(
                            'GitHub: ${contact.github}',
                            style: TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.code, color: Color(0xFF2E3192), size: 24),
                          title: Text(
                            'LeetCode: ${contact.leetcode}',
                            style: TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}