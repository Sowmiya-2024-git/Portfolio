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
                  Text(
                    'Contact',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(width: 48),
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
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Email: ${contact.email}', style: TextStyle(fontSize: 16, color: Colors.black87)),
                        SizedBox(height: 10),
                        Text('Phone: ${contact.phone}', style: TextStyle(fontSize: 16, color: Colors.black87)),
                        SizedBox(height: 10),
                        Text('LinkedIn: ${contact.linkedin}', style: TextStyle(fontSize: 16, color: Colors.black87)),
                        SizedBox(height: 10),
                        Text('GitHub: ${contact.github}', style: TextStyle(fontSize: 16, color: Colors.black87)),
                        SizedBox(height: 10),
                        Text('LeetCode: ${contact.leetcode}', style: TextStyle(fontSize: 16, color: Colors.black87)),
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