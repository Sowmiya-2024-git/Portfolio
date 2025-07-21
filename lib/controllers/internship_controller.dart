import 'package:flutter/material.dart';
import '../models/internship_model.dart';

class InternshipController {
  InternshipModel getInternship() {
    return InternshipModel(
      company: 'Avasoft Pvt Ltd',
      role: 'ServiceNow Trainee Engineer Intern',
      duration: 'Mar 2024 - May 2024',
      responsibilities: [
        'Trained in ITSM fundamentals and ITIL best practices',
        'Gained hands-on experience with ServiceNow workflows',
        'Learned incident, problem, and change management',
        'Worked on real-time IT incident simulations',
        'Assisted in configuring ServiceNow and creating reports',
        'Explored service catalog management and request fulfillment',
      ],
    );
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushNamed(context, '/');
  }
}