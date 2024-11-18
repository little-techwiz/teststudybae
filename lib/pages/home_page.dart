import 'package:flutter/material.dart';
//import 'teststudybae/assets/icons';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'John Henry',
            style: TextStyle(
              fontSize: 30, // Increased size of the name
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            color: Colors.black, // Notifications icon color
            onPressed: () {
              // Implement notification logic
            },
          ),
        ],
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 0.0),
            //   child: Divider(color: Colors.grey), // Added grey line
            // ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10), // Reduced space
                      _buildSectionTitle('Recent Study Materials', context),
                      _buildHorizontalList(_buildRecentStudyMaterials()),
                      const SizedBox(height: 20),
                      _buildSectionTitle('Course Resources', context),
                      _buildHorizontalList(_buildCourseResources()),
                      const SizedBox(height: 20),
                      _buildSectionTitle('Recommendations', context),
                      _buildHorizontalList(_buildPersonalizedRecommendations()),
                    ],
                  ),
                ),
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16.0),
            //   child: Divider(color: Colors.grey), // Added grey line
            // ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildSectionTitle(String title, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        TextButton(
          onPressed: () {
            // Implement "See more" navigation logic
          },
          child: Text(
            'See more',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalList(List<Widget> items) {
    return SizedBox(
      height: 140,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: items,
      ),
    );
  }

  List<Widget> _buildRecentStudyMaterials() {
    return [
      _buildBoxIcon(Icons.book, 'Comp 110', 150),
      _buildBoxIcon(Icons.book, 'Intro to Prog..', 150),
      _buildBoxIcon(Icons.book, 'Operating Sys', 150),
      _buildBoxIcon(Icons.book, 'Comp 220', 150),
      _buildBoxIcon(Icons.book, 'Assembly', 150),
    ];
  }

  List<Widget> _buildCourseResources() {
    return [
      _buildBoxIcon(Icons.note, 'COMP 223', 140),
      _buildBoxIcon(Icons.note, 'COMP 224', 140),
      _buildBoxIcon(Icons.note, 'COMP 211', 140),
      _buildBoxIcon(Icons.note, 'MATH 212', 140),
      _buildBoxIcon(Icons.note, 'PHYC 212', 140),
      _buildBoxIcon(Icons.note, 'STAT 232', 140),
    ];
  }

  List<Widget> _buildPersonalizedRecommendations() {
    return [
      _buildBoxIcon(Icons.note, 'Explore OS', 150),
      _buildBoxIcon(Icons.note, 'Dive into circuits', 150),
      _buildBoxIcon(Icons.note, 'Stat for Brainiacs', 150),
    ];
  }

  // box icon layout
  Widget _buildBoxIcon(IconData icon, String label, double wid) {
    return Container(
      width: wid,
      height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey[200]!), // Remove black border
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(label), // Text positioned at the bottom left
          ),
          Center(
            child: Icon(icon, size: 30), // Center the icon
          ),
        ],
      ),
    );
  }

  // bottom navigation bar layout
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
}
