import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/home_controller.dart';
import '../models/profile_model.dart';
import '../models/skill_model.dart';

class HomeView extends StatelessWidget {
  final Function(bool) toggleTheme;
  final bool isDarkMode;
  final HomeController _controller = HomeController();

  HomeView({required this.toggleTheme, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return _buildWithLoading(
      child: Builder(
        builder: (innerContext) {
          final profile = _controller.getProfile();
          final contact = _controller.getContactInfo();
          final skills = _controller.getSkills();

          final isMobile = MediaQuery.of(innerContext).size.width < 800;

          return Scaffold(
            body: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF2E3192), Color(0xFF1BFFFF)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: isMobile
                    ? _buildMobileLayout(innerContext, profile, contact, skills)
                    : _buildWebLayout(innerContext, profile, contact, skills),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => toggleTheme(!isDarkMode),
              child: Icon(isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
            ),
          );
        },
      ),
    );
  }

  Widget _buildWithLoading({required Widget child}) {
    return FutureBuilder(
      future: Future.delayed(Duration(milliseconds: 500)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return child;
      },
    );
  }

  Widget _buildWebLayout(BuildContext context, ProfileModel profile, ContactInfo contact, List<SkillModel> skills) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAvailabilityTag(),
                SizedBox(height: 24),
                Text(
                  "Hi, I’m\n${profile.name}",
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 8),
                Text(
                  profile.title,
                  style: TextStyle(fontSize: 24, color: Colors.white70),
                ),
                SizedBox(height: 24),
                Text(
                  profile.bio,
                  style: TextStyle(fontSize: 16, color: Colors.white60),
                ),
                SizedBox(height: 32),
                AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  child: ElevatedButton(
                    onPressed: () => _launchEmail(context, contact.email),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text("Contact Me", style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildAnimatedButton(context, 'Achievements', () => _controller.navigateToAchievements(context)),
                    _buildAnimatedButton(context, 'Education', () => _controller.navigateToEducation(context)),
                    _buildAnimatedButton(context, 'Internship', () => _controller.navigateToInternship(context)),
                    _buildAnimatedButton(context, 'Projects', () => _controller.navigateToProjects(context)),
                    _buildAnimatedButton(context, 'Contact', () => _controller.navigateToContact(context)),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              _buildProfileCard(context, profile),
              SizedBox(height: 20),
              _buildSkillsRow(skills),
              SizedBox(height: 20),
              _buildSocialIcons(context, contact),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, ProfileModel profile, ContactInfo contact, List<SkillModel> skills) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildAvailabilityTag(),
          SizedBox(height: 16),
          Text(
            "Hi, I’m\n${profile.name}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            profile.title,
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
          SizedBox(height: 16),
          Text(
            profile.bio,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.white60),
          ),
          SizedBox(height: 24),
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            child: ElevatedButton(
              onPressed: () => _launchEmail(context, contact.email),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text("Contact Me", style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildAnimatedButton(context, 'Achievements', () => _controller.navigateToAchievements(context)),
              _buildAnimatedButton(context, 'Education', () => _controller.navigateToEducation(context)),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildAnimatedButton(context, 'Internship', () => _controller.navigateToInternship(context)),
              _buildAnimatedButton(context, 'Projects', () => _controller.navigateToProjects(context)),
            ],
          ),
          SizedBox(height: 16),
          _buildAnimatedButton(context, 'Contact', () => _controller.navigateToContact(context)),
          SizedBox(height: 30),
          _buildProfileCard(context, profile),
          SizedBox(height: 20),
          _buildSkillsRow(skills),
          SizedBox(height: 20),
          _buildSocialIcons(context, contact),
        ],
      ),
    );
  }

  Widget _buildAnimatedButton(BuildContext context, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/loading', arguments: onTap).then((_) {
          // Handle navigation completion if needed
        }).catchError((e) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Navigation error: $e')));
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2)],
        ),
        child: Text(label, style: TextStyle(fontSize: 14, color: Colors.black)),
      ),
    );
  }

  Widget _buildAvailabilityTag() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.lightBlue.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text("• AVAILABLE FOR WORK", style: TextStyle(fontSize: 12, color: Colors.blue[900])),
    );
  }

  Widget _buildProfileCard(BuildContext context, ProfileModel profile) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.shade100,
      ),
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 48,
            backgroundImage: AssetImage(profile.imageUrl),
            onBackgroundImageError: (_, __) => Icon(Icons.error, color: Colors.red),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(profile.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text("Erode-Tamil Nadu, India", style: TextStyle(fontSize: 12)),
                SizedBox(height: 8),
                Text(profile.title, style: TextStyle(fontSize: 12, color: Colors.grey[800])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsRow(List<SkillModel> skills) {
    return Column(
      children: skills.map((skill) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Expanded(
              child: Text(
                '${skill.skill} (${(skill.level * 100).toStringAsFixed(0)}%)',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            SizedBox(
              width: 150,
              child: LinearProgressIndicator(
                value: skill.level,
                backgroundColor: Colors.grey[400],
                color: Colors.blue,
                minHeight: 10,
              ),
            ),
          ],
        ),
      )).toList(),
    );
  }

  Widget _buildSocialIcons(BuildContext context, ContactInfo contact) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIconButton(context, Icons.email, () => _launchUrl(context, 'mailto:${contact.email}')),
        _buildIconButton(context, Icons.link, () => _launchUrl(context, contact.linkedinUrl)),
        _buildIconButton(context, Icons.code, () => _launchUrl(context, contact.githubUrl)),
      ],
    );
  }

  Widget _buildIconButton(BuildContext context, IconData icon, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          child: Icon(icon, color: Colors.black),
        ),
      ),
    );
  }

  void _launchEmail(BuildContext context, String email) {
    _launchUrl(context, 'mailto:$email');
  }

  void _launchUrl(BuildContext context, String url) async {
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Could not launch $url')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error launching URL: $e')));
    }
  }
}

// LoadingScreen
class LoadingScreen extends StatelessWidget {
  final VoidCallback onTap;

  LoadingScreen({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.delayed(Duration(milliseconds: 500)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          WidgetsBinding.instance.addPostFrameCallback((_) {
            onTap();
            Navigator.pop(context);
          });
          return Container();
        },
      ),
    );
  }
}
