// lib/views/projects_view.dart
import 'package:flutter/material.dart';
import '../controllers/projects_controller.dart';

class ProjectsView extends StatelessWidget {
  final ProjectsController _controller = ProjectsController();

  @override
  Widget build(BuildContext context) {
    final projects = _controller.getProjects();

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
                        'Projects',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.5,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.work, color: Colors.white, size: 28),
                    ],
                  ),
                  SizedBox(width: 48), // Placeholder to balance layout
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.white.withOpacity(0.95),
                    margin: EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.code, color: Color(0xFF2E3192), size: 24),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  projects[index].title,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF2E3192),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            projects[index].description,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.build, color: Colors.grey[600], size: 18),
                              SizedBox(width: 5),
                              Text(
                                'Tech: ${projects[index].tech}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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