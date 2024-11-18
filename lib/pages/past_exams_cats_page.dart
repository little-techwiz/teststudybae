import 'package:flutter/material.dart';

class PastExamsCatsPage extends StatelessWidget {
  const PastExamsCatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Past Exams & CATs'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
              _buildSectionTitle('Course Categories'),
              _buildCourseCategories(),
              const SizedBox(height: 20),
              _buildSectionTitle('Available Exams/Tests'),
              _buildAvailableExamsTests(),
              const SizedBox(height: 20),
              _buildSectionTitle('Filter and Sort Options'),
              _buildFilterAndSortOptions(),
              const SizedBox(height: 20),
              _buildSectionTitle('Interactive Elements'),
              _buildInteractiveElements(),
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

  Widget _buildCourseCategories() {
    return Column(
      children: [
        _buildCourseCategory('Introduction to Programming'),
        _buildCourseCategory('Data Structures and Algorithms'),
        _buildCourseCategory('Database Management Systems'),
      ],
    );
  }

  Widget _buildCourseCategory(String courseName) {
    return ExpansionTile(
      title: Text(courseName),
      children: [
        _buildListItem('Midterm Exam'),
        _buildListItem('Final Exam'),
        _buildListItem('Continuous Assessment Test 1'),
      ],
    );
  }

  Widget _buildAvailableExamsTests() {
    return Column(
      children: [
        _buildListItem('Midterm Exam 1'),
        _buildListItem('Final Exam 1'),
        _buildListItem('CAT 1'),
      ],
    );
  }

  Widget _buildFilterAndSortOptions() {
    return const Column(
      children: [
        // Placeholder for filter and sort options
        Text('Filter: Midterms, Finals, CATs'),
        Text('Sort by: Date, Relevance'),
      ],
    );
  }

  Widget _buildInteractiveElements() {
    return Column(
      children: [
        _buildDiscussionSection(),
        _buildNotesSection(),
      ],
    );
  }

  Widget _buildDiscussionSection() {
    return const Column(
      children: [
        Text(
          'Discussion',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ListTile(
          title: Text('Student 1: Question 1'),
        ),
        ListTile(
          title: Text('Student 2: Answer 1'),
        ),
        ListTile(
          title: TextField(
            decoration: InputDecoration(
              hintText: 'Add a question or comment',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNotesSection() {
    return const Column(
      children: [
        Text(
          'Notes',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        ListTile(
          title: Text('Note 1'),
        ),
        ListTile(
          title: Text('Note 2'),
        ),
        ListTile(
          title: TextField(
            decoration: InputDecoration(
              hintText: 'Add a note',
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListItem(String title) {
    return ListTile(
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () {
              // Implement download functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.bookmark),
            onPressed: () {
              // Implement bookmark functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.visibility),
            onPressed: () {
              // Implement view functionality
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
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
