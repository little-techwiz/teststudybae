import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Implement navigation to notifications page
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
              _buildSectionTitle('Overview'),
              _buildOverview(),
              const SizedBox(height: 20),
              _buildSectionTitle('Access Study Materials'),
              _buildAccessStudyMaterials(),
              const SizedBox(height: 20),
              _buildSectionTitle('Calendar Overview'),
              _buildCalendarOverview(),
              const SizedBox(height: 20),
              _buildSectionTitle('To-do List'),
              _buildTodoList(),
              const SizedBox(height: 20),
              _buildSectionTitle('Recommended Resources'),
              _buildRecommendedResources(),
              const SizedBox(height: 20),
              _buildSectionTitle('Quick Links'),
              _buildQuickLinks(),
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

  Widget _buildOverview() {
    return const Column(
      children: [
        // Placeholder for progress bar or chart
        Text('Progress: 70% completed'),
        // Placeholder for recent activities
        Text('Recent Activity 1'),
        Text('Recent Activity 2'),
      ],
    );
  }

  Widget _buildAccessStudyMaterials() {
    return Column(
      children: [
        _buildListItem('Course 1'),
        _buildListItem('Course 2'),
        _buildListItem('Course 3'),
      ],
    );
  }

  Widget _buildCalendarOverview() {
    return const Column(
      children: [
        // Placeholder for calendar events
        Text('Upcoming Event 1'),
        Text('Upcoming Event 2'),
      ],
    );
  }

  Widget _buildTodoList() {
    return Column(
      children: [
        _buildListItem('To-do Item 1'),
        _buildListItem('To-do Item 2'),
      ],
    );
  }

  Widget _buildRecommendedResources() {
    return Column(
      children: [
        _buildListItem('Recommended Resource 1'),
        _buildListItem('Recommended Resource 2'),
      ],
    );
  }

  Widget _buildQuickLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildQuickLinkItem(Icons.calculate, 'Calculator'),
        _buildQuickLinkItem(Icons.book, 'Dictionary'),
        _buildQuickLinkItem(Icons.note, 'Notes'),
      ],
    );
  }

  Widget _buildQuickLinkItem(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 40),
        const SizedBox(height: 10),
        Text(label),
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
        BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Study & Exams'),
        BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Progress'),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'AI Assistant'),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/home');
            break;
          case 1:
            Navigator.pushNamed(context, '/dashboard');
            break;
          case 2:
            showModalBottomSheet(
              context: context,
              builder: (context) => _buildStudyExamsSelection(context),
            );
            break;
          case 3:
            Navigator.pushNamed(context, '/progress');
            break;
          case 4:
            Navigator.pushNamed(context, '/ai-chat');
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
