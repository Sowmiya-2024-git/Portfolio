import 'package:flutter/material.dart';
import '../controllers/internship_controller.dart';

class InternshipView extends StatelessWidget {
  final InternshipController _controller = InternshipController();

  @override
  Widget build(BuildContext context) {
    final internship = _controller.getInternship();

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
                    'Internship',
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
                        Text(
                          internship.company,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF2E3192)),
                        ),
                        SizedBox(height: 10),
                        Text(
                          internship.role,
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                        SizedBox(height: 5),
                        Text(
                          internship.duration,
                          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Responsibilities:',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF2E3192)),
                        ),
                        ...internship.responsibilities.map((resp) => Padding(
                          padding: const EdgeInsets.only(left: 16, top: 5),
                          child: Text(
                            '• $resp',
                            style: TextStyle(fontSize: 14, color: Colors.black87),
                          ),
                        )).toList(),
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