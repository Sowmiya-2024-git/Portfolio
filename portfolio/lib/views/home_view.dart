import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/home_controller.dart';
import '../widgets/skill_card.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _showEmail = false;
  final HomeController _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    final profile = _controller.getProfile();
    final skills = _controller.getSkills();
    final contact = _controller.getContactInfo(); // Get contact info for email and LinkedIn

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2E3192), Color(0xFF1BFFFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header with Professional Photo and Branding
              Container(
                padding: EdgeInsets.all(16),
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white.withOpacity(0.9),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage('assets/photo.jpg'),
                        ),
                        SizedBox(height: 20),
                        Text(
                          profile.name,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2E3192),
                          ),
                        ),
                        Text(
                          'Aspiring MCA Student | Mobile App Developer',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.grey[700],
                            fontFamily: 'Roboto',
                          ),
                        ),
                        SizedBox(height: 12),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Passionate MCA student and Mobile App Developer proficient in Java, Data Structures, and DBMS. Specializing in React Native and Flutter, I build robust and user-centric mobile applications. Eager to leverage technical expertise in dynamic environments to contribute to innovative software development solutions.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Skills Section with Enhanced Representation
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white.withOpacity(0.9),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Technical Skills',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2E3192),
                          ),
                        ),
                        SizedBox(height: 15),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: skills
                              .map((skill) => SkillCard(
                                    skill: skill.skill,
                                    level: skill.level,
                                    //color: Color(0xFF1BFFFF),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Project Previews Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white.withOpacity(0.9),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Featured Projects',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2E3192),
                          ),
                        ),
                        SizedBox(height: 15),
                        _buildProjectCard(
                          context,
                          _controller,
                          'Talkaholic Chatter',
                          'Real-time chat app with Firebase integration for authentication and messaging.',
                          'Flutter, Dart, Firebase',
                          'assets/talkaholic_preview.jpg',
                        ),
                        SizedBox(height: 15),
                        _buildProjectCard(
                          context,
                          _controller,
                          'Smart Learning Platform',
                          'App for deafblind users with Braille input and haptic feedback.',
                          'React Native, Node.js',
                          'assets/smartlearning_preview.jpg',
                        ),
                        SizedBox(height: 15),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: Color(0xFF1BFFFF),
                            foregroundColor: Colors.black87,
                          ),
                          onPressed: () => _controller.navigateToProjects(context),
                          child: Text(
                            'View All Projects',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Action Buttons
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Color(0xFF1BFFFF),
                        foregroundColor: Colors.black87,
                      ),
                      onPressed: () => _controller.navigateToEducation(context),
                      child: Text(
                        'View Education',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Color(0xFF1BFFFF),
                        foregroundColor: Colors.black87,
                      ),
                      onPressed: () => _controller.navigateToInternship(context),
                      child: Text(
                        'View Internship',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Color(0xFF1BFFFF),
                        foregroundColor: Colors.black87,
                      ),
                      onPressed: () => _controller.navigateToAchievements(context),
                      child: Text(
                        'View Achievements',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Color(0xFF1BFFFF),
                        foregroundColor: Colors.black87,
                      ),
                      onPressed: () => _controller.navigateToContact(context),
                      child: Text(
                        'Contact Me',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              // Footer with Contact Info
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white.withOpacity(0.9),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          'Let\'s Connect!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2E3192),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.email, color: Color(0xFF2E3192)),
                              onPressed: () {
                                setState(() {
                                  _showEmail = !_showEmail;
                                });
                              },
                            ),
                            if (_showEmail)
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  contact.email,
                                  style: TextStyle(fontSize: 16, color: Color(0xFF2E3192)),
                                ),
                              ),
                            SizedBox(width: 10),
                            IconButton(
                              icon: Icon(Icons.link, color: Color(0xFF2E3192)),
                              onPressed: () async {
                                final url = contact.linkedinUrl;
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Could not launch $url')),
                                  );
                                }
                              },
                              tooltip: 'LinkedIn',
                            ),
                            SizedBox(width: 10),
                            IconButton(
                              icon: Icon(Icons.code, color: Color(0xFF2E3192)),
                              onPressed: () {},
                              tooltip: 'GitHub',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, HomeController controller, String title, String description, String tech, String imagePath) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () => controller.navigateToProjects(context),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: imagePath.isNotEmpty
                      ? DecorationImage(
                          image: AssetImage(imagePath),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: imagePath.isEmpty ? Icon(Icons.image, size: 40, color: Colors.grey) : null,
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E3192),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      description,
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    SizedBox(height: 5),
                    Text(
                      tech,
                      style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}