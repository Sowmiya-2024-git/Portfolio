import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    final profile = _controller.getProfile();
    final contact = _controller.getContactInfo();

    final isMobile = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: isMobile ? _buildMobileLayout(profile, contact) : _buildWebLayout(profile, contact),
      ),
    );
  }

  Widget _buildWebLayout(profile, contact) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Side - Intro & Contact CTA
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
                  "Hi, I’m\nSowmiya Sree M",
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  "Mobile App Developer | MCA Student",
                  style: TextStyle(fontSize: 24, color: Colors.black87),
                ),
                SizedBox(height: 24),
                Text(
                  " Passionate about programming, with a strong grip on Java, Data Structures, and DBMS. Skilled in problem-solving and mobile app development using React Native and Flutter.Eager to apply technical abilities in dynamic environments, and seeking opportunities to learn, grow, and contribute to innovative solutions",
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () => _launchEmail(contact.email),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text("Contact Me", style: TextStyle(fontSize: 16, color: Colors.white)),
                )
              ],
            ),
          ),
        ),

        // Right Side - Profile, Socials & Brands
        Expanded(
          flex: 3,
          child: Column(
            children: [
              _buildProfileCard(profile),
              SizedBox(height: 20),
              _buildTechBrandsRow(),
              SizedBox(height: 20),
              _buildSocialIcons(contact),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(profile, contact) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildAvailabilityTag(),
          SizedBox(height: 16),
          Text(
            "Hi, I’m\nSowmiya Sree M",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            "Mobile App Developer | MCA Student",
            style: TextStyle(fontSize: 18, color: Colors.black87),
          ),
          SizedBox(height: 16),
          Text(
            "I build mobile-first applications using Flutter and React Native and am passionate about accessible UI/UX.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => _launchEmail(contact.email),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: Text("Contact Me", style: TextStyle(fontSize: 16, color: Colors.white)),
          ),
          SizedBox(height: 30),
          _buildProfileCard(profile),
          SizedBox(height: 20),
          _buildTechBrandsRow(),
          SizedBox(height: 20),
          _buildSocialIcons(contact),
        ],
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

  Widget _buildProfileCard(profile) {
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
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sowmiya Sree Murugesan", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text("Erode-Tamil Nadu, India", style: TextStyle(fontSize: 12)),
                SizedBox(height: 8),
                Text("DevOps Engineer,Mobile Application Developer", style: TextStyle(fontSize: 12, color: Colors.grey[800])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcons(ContactInfo contact) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIconButton(Icons.email, () => _launchEmail(contact.email)),
        _buildIconButton(Icons.link, () => _launchUrl(contact.linkedinUrl)),
        _buildIconButton(Icons.code, () => _launchUrl(contact.githubUrl)),
      ],
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onTap) {
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

  Widget _buildTechBrandsRow() {
    final techs = ["Flutter", "Firebase", "MongoDB", "React Native"];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: techs
          .map((tech) => Chip(
                label: Text(tech),
                backgroundColor: Colors.purple.shade50,
                labelStyle: TextStyle(color: Colors.purple),
              ))
          .toList(),
    );
  }

  void _launchEmail(String email) {
    launch("mailto:$email");
  }

  void _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
