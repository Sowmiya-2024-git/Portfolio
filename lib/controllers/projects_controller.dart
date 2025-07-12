// lib/controllers/projects_controller.dart
import 'package:flutter/material.dart';
import '../models/project_model.dart';

class ProjectsController {
  List<Project> getProjects() {
    return [
      Project(
        title: 'Talkaholic Chatter',
        description: 'Built a real-time chat application with user authentication and cloud messaging. Enabled smooth, responsive UI with Firebase integration for chat storage and notifications.',
        tech: 'Flutter, Dart, Firebase',
      ),
      Project(
        title: 'Smart Learning Platform for Deafblind',
        description: 'Designed an app to teach English and numbers to deafblind users via Braille input. Features include haptic feedback, mode switching, and Chatbot-based support.',
        tech: 'React Native, Node.js',
      ),
      Project(
        title: 'Ecommerce - Shopverse',
        description: 'Developed a full-stack e-commerce platform enabling product purchasing, selling, real-time stock updates, and secure PayPal transactions.',
        tech: 'React.js, Node.js, MongoDB',
      ),
      Project(
        title: 'Course Management System',
        description: 'Developed a Course Management App using Flutter, Firebase, and MVVM, enabling Admins to manage courses and Users to register, log in, and view courses. Integrated GetX for state management with smooth navigation and a clean, responsive UI.',
        tech: 'Flutter, Firebase',
      ),
    ];
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushNamed(context, '/'); // Navigate to home page
  }
}