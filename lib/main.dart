import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'views/home_view.dart';
import 'views/achievements_view.dart';
import 'views/education_view.dart';
import 'views/internship_view.dart';
import 'views/projects_view.dart';
import 'views/contact_view.dart';
import 'views/home_view.dart' as home; // Import to resolve LoadingScreen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isDarkMode = prefs.getBool('isDarkMode') ?? false;
  runApp(PortfolioApp(isDarkMode: isDarkMode));
}

class PortfolioApp extends StatefulWidget {
  final bool isDarkMode;

  PortfolioApp({required this.isDarkMode});

  @override
  _PortfolioAppState createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  bool _isDarkMode;

  _PortfolioAppState() : _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.isDarkMode;
  }

  void toggleTheme(bool value) async {
    setState(() => _isDarkMode = value);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sowmiya Sree M Portfolio',
      theme: _isDarkMode ? ThemeData.dark() : ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeView(toggleTheme: toggleTheme, isDarkMode: _isDarkMode),
        '/achievements': (context) => AchievementsView(),
        '/education': (context) => EducationView(),
        '/internship': (context) => InternshipView(),
        '/projects': (context) => ProjectsView(),
        '/contact': (context) => ContactView(),
        '/loading': (context) {
          final onTap = ModalRoute.of(context)?.settings.arguments as VoidCallback?;
          return onTap != null ? home.LoadingScreen(onTap: onTap) : Container();
        },
      },
    );
  }
}