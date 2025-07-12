import 'package:flutter/material.dart';

class SkillCard extends StatelessWidget {
  final String skill;
  final double level;

  SkillCard({required this.skill, required this.level});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(skill),
        subtitle: LinearProgressIndicator(value: level),
      ),
    );
  }
}