import 'package:flutter/material.dart';
import '../models/profile_model.dart';
import '../models/skill_model.dart';

class ContactInfo {
  final String email;
  final String linkedinUrl;
  final String githubUrl;

  ContactInfo({required this.email, required this.linkedinUrl, required this.githubUrl});
}

class HomeController {
  ContactInfo getContactInfo() {
    return ContactInfo(
      email: 'sowmiyasreem.24mca@kongu.edu',
      linkedinUrl: 'https://www.linkedin.com/in/sowmiya-sree-murugesan-8142ab272/',
      githubUrl: 'https://github.com/Sowmiya-2024-git',
    );
  }

  ProfileModel getProfile() {
    return ProfileModel(
      name: 'Sowmiya Sree M',
      title: 'MCA Student | Mobile App Developer',
      bio: 'Passionate about programming, with a strong grip on Java, Data Structures, and DBMS. Skilled in problem-solving and mobile app development using React Native and Flutter. Eager to apply technical abilities in dynamic environments, seeking opportunities to learn, grow, and contribute to innovative solutions.',
      imageUrl: 'assets/photo.jpg',
    );
  }

  List<SkillModel> getSkills() {
    return [
      SkillModel(skill: 'Java', level: 0.85),
      SkillModel(skill: 'Dart', level: 0.80),
      SkillModel(skill: 'SQL', level: 0.75),
      SkillModel(skill: 'React Native', level: 0.80),
      SkillModel(skill: 'Flutter', level: 0.85),
      SkillModel(skill: 'Firebase', level: 0.75),
      SkillModel(skill: 'Data Structures', level: 0.80),
      SkillModel(skill: 'DBMS', level: 0.80),
    ];
  }

  void navigateToProjects(BuildContext context) {
    Navigator.pushNamed(context, '/projects');
  }

  void navigateToContact(BuildContext context) {
    Navigator.pushNamed(context, '/contact');
  }

  void navigateToEducation(BuildContext context) {
    Navigator.pushNamed(context, '/education');
  }

  void navigateToInternship(BuildContext context) {
    Navigator.pushNamed(context, '/internship');
  }

  void navigateToAchievements(BuildContext context) {
    Navigator.pushNamed(context, '/achievements');
  }
}