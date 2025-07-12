// lib/controllers/education_controller.dart
import '../models/education_model.dart';
import 'package:flutter/material.dart';

class EducationController {
  List<EducationModel> getEducation() {
    return [
      EducationModel(
        institution: 'Kongu Engineering College',
        degree: 'Master of Computer Applications',
        duration: '2024 - 2026',
        score: 'CGPA: 8.50 (pursuing)',
      ),
      EducationModel(
        institution: 'Kongu Engineering College',
        degree: 'Bachelor of Computer Technology',
        duration: '2021 - 2024',
        score: 'CGPA: 8.14',
      ),
      EducationModel(
        institution: 'Shree Swami Vivekananda School',
        degree: 'HSC',
        duration: '2020 - 2021',
        score: '90.79%',
      ),
      EducationModel(
        institution: 'Shree Swami Vivekananda School',
        degree: 'SSLC',
        duration: '2018 - 2019',
        score: '86.6%',
      ),
    ];
  }

  void navigateToHome(BuildContext context) {
    Navigator.pop(context,'/'); // Pops the current screen to return to the previous screen (e.g., home)
  }
}