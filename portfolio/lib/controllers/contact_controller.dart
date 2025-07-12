import 'package:flutter/material.dart';

import '../models/contact_model.dart';

class ContactController {
  ContactModel getContactInfo() {
    return ContactModel(
      email: 'sowmiyasreem.24mca@kongu.edu',
      phone: '+91 9943119470',
      linkedin: 'linkedin.com/in/sowmiyasree-8142ab272',
      github: 'github.com/Sowmiya-2024-git',
      leetcode: 'leetcode.com/sowmiya_24',
    );
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushNamed(context, '/'); // Navigate to home page
  }
}