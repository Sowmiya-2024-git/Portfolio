import 'package:flutter/material.dart';
import '../controllers/projects_controller.dart';
import '../models/project_model.dart';

class ProjectsView extends StatefulWidget {
  final ProjectsController _controller = ProjectsController();

  @override
  _ProjectsViewState createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  final ScrollController _scrollController = ScrollController();
  List<Project> _projects = [];
  int _currentPage = 0;
  final int _pageSize = 2; // Number of items per load
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadMoreProjects();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMoreProjects() async {
    if (_isLoading) return;
    setState(() => _isLoading = true);
    await Future.delayed(Duration(milliseconds: 500)); // Simulate network delay
    final allProjects = widget._controller.getProjects();
    final startIndex = _currentPage * _pageSize;
    final endIndex = (startIndex + _pageSize) <= allProjects.length
        ? (startIndex + _pageSize)
        : allProjects.length;
    if (startIndex < allProjects.length) {
      setState(() {
        _projects.addAll(allProjects.sublist(startIndex, endIndex));
        _currentPage++;
        _isLoading = false;
      });
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      _loadMoreProjects();
    }
  }

  @override
  Widget build(BuildContext context) {
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
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white, size: 28),
                    onPressed: () => widget._controller.navigateToHome(context),
                    tooltip: 'Back to Home',
                  ),
                  Text(
                    'Projects',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(width: 48),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: EdgeInsets.all(16),
                itemCount: _projects.length + (_isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index >= _projects.length) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final project = _projects[index];
                  return Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.white.withOpacity(0.95),
                    margin: EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.title,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF2E3192)),
                          ),
                          SizedBox(height: 10),
                          Text(
                            project.description,
                            style: TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Tech Stack: ${project.tech}',
                            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                          ),
                        ],
                      ),
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