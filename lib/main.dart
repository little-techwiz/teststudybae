import 'package:flutter/material.dart';
import 'package:teststudybae/pages/home_page.dart';
import 'package:teststudybae/pages/login_signup_page.dart';
import 'package:teststudybae/pages/dashboard_page.dart';
import 'package:teststudybae/pages/progress_tracker_page.dart';
import 'package:teststudybae/pages/study_material_page.dart';
import 'package:teststudybae/pages/past_exams_cats_page.dart';
import 'package:teststudybae/pages/ai_chat_page.dart';
import 'package:teststudybae/pages/document_view_page.dart';

void main() {
  runApp(const StudyApp());
}

class StudyApp extends StatelessWidget {
  const StudyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study App',
      theme: ThemeData(
        primaryColor: const Color(0xFF25D366),
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        textTheme: const TextTheme(
          labelLarge: TextStyle(color: Color(0xFF000000)), // Replaces bodyText1
          bodyMedium: TextStyle(color: Color(0xFF4F4F4F)), // Replaces bodyText2
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFF25D366),
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      darkTheme: ThemeData(
        primaryColor: const Color(0xFF25D366),
        scaffoldBackgroundColor: const Color(0xFF121212),
        textTheme: const TextTheme(
          labelLarge: TextStyle(color: Color(0xFFFFFFFF)), // Replaces bodyText1
          bodyMedium: TextStyle(color: Color(0xFFB3B3B3)), // Replaces bodyText2
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFF25D366),
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const LoginSignupPage(),
        '/home': (context) => const HomePage(),
        '/dashboard': (context) => const DashboardPage(),
        '/progress': (context) => const ProgressTrackerPage(),
        '/study-materials': (context) => const StudyMaterialPage(),
        '/past-exams': (context) => const PastExamsCatsPage(),
        '/ai-chat': (context) => const AiChatPage(),
        '/document-view': (context) => const DocumentViewPage(),
        '/study-exams': (context) => const StudyMaterialPage(), // Replace with the correct page if needed
      },
      initialRoute: '/',
    );
  }
}
