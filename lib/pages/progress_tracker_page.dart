import 'package:flutter/material.dart';

class ProgressTrackerPage extends StatelessWidget {
  const ProgressTrackerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Tracker'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Overall Progress Summary'),
              _buildOverallProgressSummary(),
              const SizedBox(height: 20),
              _buildSectionTitle('Course-Specific Progress'),
              _buildCourseSpecificProgress(),
              const SizedBox(height: 20),
              _buildSectionTitle('Goals and Milestones'),
              _buildGoalsAndMilestones(),
              const SizedBox(height: 20),
              _buildSectionTitle('Detailed Progress Reports'),
              _buildDetailedProgressReports(),
              const SizedBox(height: 20),
              _buildSectionTitle('Motivational Elements'),
              _buildMotivationalElements(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildOverallProgressSummary() {
    return const Column(
      children: [
        // Placeholder for progress bar or pie chart
        Text('Overall Progress: 70% completed'),
      ],
    );
  }

  Widget _buildCourseSpecificProgress() {
    return Column(
      children: [
        _buildListItem('Course 1: 80% completed'),
        _buildListItem('Course 2: 60% completed'),
        _buildListItem('Course 3: 90% completed'),
      ],
    );
  }

  Widget _buildGoalsAndMilestones() {
    return Column(
      children: [
        _buildListItem('Daily Goal: Study 2 hours'),
        _buildListItem('Weekly Goal: Complete Module 1'),
        _buildListItem('Monthly Goal: Pass Midterm Exam'),
        _buildListItem('Milestone: Completed Module 1'),
      ],
    );
  }

  Widget _buildDetailedProgressReports() {
    return Column(
      children: [
        _buildListItem('Assignment 1: Grade A'),
        _buildListItem('Exam 1: Grade B+'),
        _buildListItem('Study Time: 15 hours this week'),
      ],
    );
  }

  Widget _buildMotivationalElements() {
    return Column(
      children: [
        _buildListItem('Achievement: Completed 10 assignments'),
        _buildListItem('Badge: Quiz Master'),
        _buildListItem('Motivational Quote: "Keep pushing forward!"'),
      ],
    );
  }

  Widget _buildListItem(String title) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // Implement navigation to detailed content
      },
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white, // Ensure the bottom nav uses a light background
      selectedItemColor: Theme.of(context).primaryColor, // Active item color for visibility
      unselectedItemColor: Colors.black, // Inactive item color for contrast
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Study'),
        BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Progress'),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/home');
            break;
          case 1:
            Navigator.pushNamed(context, '/study-exams');
            break;
          case 2:
            Navigator.pushNamed(context, '/progress');
            break;
        }
      },
    );
  }

  Widget _buildStudyExamsSelection(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        ListTile(
          title: const Text('Study Materials'),
          onTap: () {
            Navigator.pushNamed(context, '/study-materials');
          },
        ),
        ListTile(
          title: const Text('Past Exams & CATs'),
          onTap: () {
            Navigator.pushNamed(context, '/past-exams');
          },
        ),
      ],
    );
  }
}
