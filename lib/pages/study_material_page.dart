import 'package:flutter/material.dart';

class StudyMaterialPage extends StatelessWidget {
  const StudyMaterialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Study Materials'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('My Courses'),
              _buildCourseCategories(),
              const SizedBox(height: 20),
              _buildSectionTitle('Materials List'),
              _buildMaterialsList(),
              // removed unnecessacry components
              // const SizedBox(height: 20),
              // _buildSectionTitle('Filter and Sort Options'),
              // _buildFilterAndSortOptions(),
              // const SizedBox(height: 20),
              // _buildSectionTitle('Interactive Elements'),
              // _buildInteractiveElements(),
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
        fontSize: 16,
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
        _buildCourseCategory('Integral Calculus'),
        _buildCourseCategory('Statistics and Probabilities'),
      ],
    );
  }

  Widget _buildCourseCategory(String courseName) {
    return ExpansionTile(
      title: Text(courseName,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
      ),
      children: [
        _buildListItem('Lecture 1'),
        _buildListItem('Lecture 2'),
        _buildListItem('Lecture 3'),
      ],
    );
  }

  Widget _buildMaterialsList() {
    return Column(
      children: [
        _buildListItem('Material 1'),
        _buildListItem('Material 2'),
        _buildListItem('Material 3'),
      ],
    );
  }

  Widget _buildFilterAndSortOptions() {
    return const Column(
      children: [
        // Placeholder for filter and sort options
        Text('Filter: Notes, Videos, Articles'),
        Text('Sort by: Date, Relevance, Popularity'),
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
          title: Text('Student 1: Comment 1'),
        ),
        ListTile(
          title: Text('Student 2: Comment 2'),
        ),
        ListTile(
          title: TextField(
            decoration: InputDecoration(
              hintText: 'Add a comment',
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
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // IconButton(
          //   icon: const Icon(Icons.download),
          //   onPressed: () {
          //     // Implement download functionality
          //   },
          // ),
          IconButton(
            icon: const Icon(Icons.bookmark),
            onPressed: () {
              // Implement bookmark functionality
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white, // Ensure the bottom nav uses a light background
      selectedItemColor: Theme.of(context).primaryColor, // Active item color for visibility
      unselectedItemColor: Colors.grey, // Inactive item color for contrast
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
