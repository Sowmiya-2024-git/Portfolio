import 'package:flutter/material.dart';
import '../controllers/achievements_controller.dart';

class AchievementsView extends StatelessWidget {
  final AchievementsController _controller = AchievementsController();

  @override
  Widget build(BuildContext context) {
    final achievements = _controller.getAchievements();

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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white, size: 28),
                    onPressed: () => _controller.navigateToHome(context),
                    tooltip: 'Back to Home',
                  ),
                  Text(
                    'Achievements',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 48),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: achievements.length,
                itemBuilder: (context, index) {
                  final achievement = achievements[index];
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(achievement.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      subtitle: Text('${achievement.details}\nDate: ${achievement.date}'),
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