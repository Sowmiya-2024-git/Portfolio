import 'package:flutter/material.dart';

import '../models/achievement_model.dart';

class AchievementsController {
  List<AchievementModel> getAchievements() {
    return [
      AchievementModel(
        title: 'First Prize in Coding Contest',
        details: 'Received a cash prize of 3,000',
        date: 'March 2025',
      ),
      AchievementModel(
        title: 'Second Place in Technical Quiz',
        details: 'Competed at KGiSL',
        date: 'November 2024',
      ),
      AchievementModel(
        title: 'Second Place in Debugging Competition',
        details: 'Held at Kongu Engineering College',
        date: 'November 2024',
      ),
      AchievementModel(
        title: 'Finalist in TNWise Hackathon',
        details: 'Held at Rajalakshmi Engineering College, Chennai',
        date: 'April 2025',
      ),
      AchievementModel(
        title: 'Participated in Coding Contest',
        details: 'Held at Nandha Engineering College',
        date: 'January 2023',
      ),
      AchievementModel(
        title: 'Participated in Coding Ninjas Event',
        details: 'Showcased coding skills at Kongu Engineering College',
        date: '',
      ),
    ];
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushNamed(context, '/'); // Navigate to home page
  }
}