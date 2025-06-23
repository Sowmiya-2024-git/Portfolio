import 'package:flutter/material.dart';
import 'views/home_view.dart';
import 'views/projects_view.dart';
import 'views/contact_view.dart';
import 'views/education_view.dart';
import 'views/internship_view.dart';
import 'views/achievements_view.dart';

void main() {
  runApp(PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sowmiya Sree M Portfolio',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner:false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeView(),
        '/projects': (context) => ProjectsView(),
        '/contact': (context) => ContactView(),
        '/education': (context) => EducationView(),
        '/internship': (context) => InternshipView(),
        '/achievements': (context) => AchievementsView(),
      },
    );
  }
}