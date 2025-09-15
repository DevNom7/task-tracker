// Flutter Task Tracker
// Naim Lindsay
// September 9/10 to 9/15/2025
// A simple task tracker app built with Flutter.
// Features: Add, edit, delete, and filter tasks with local persistence.

// Import Flutter's material design library for UI components
import 'package:flutter/material.dart';
// Import our custom home page widget
import 'package:task_tracker/pages/home_page.dart';

// Main entry point of the Flutter app
void main() {
  // Initialize Flutter binding before running the app
  WidgetsFlutterBinding.ensureInitialized();
  // Start the app with our root widget
  runApp(const TaskTrackerApp());
}

// Root widget class that extends StatelessWidget (no state changess)
class TaskTrackerApp extends StatelessWidget {
  // Constructor with const keyword for performance optimization
  const TaskTrackerApp({super.key});

  // Override the build method to define the widget tree
  @override
  Widget build(BuildContext context) {
    // Return MaterialApp which provides Material Design theming and navigation
    return MaterialApp(
      // Hide the debug banner in release mode
      debugShowCheckedModeBanner: false,
      // Set the app title
      title: 'Task Tracker ',
      // Define the light theme
      theme: ThemeData(
        // Create a color scheme from a seed color (purple)
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6750A4)),
        // Use Material 3 design system
        useMaterial3: true,
      ),
      // Define the dark theme
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          // Same seed color but with dark brightness
          seedColor: const Color(0xFF6750A4),
          brightness: Brightness.dark,
        ),
        // Use Material 3 design system
        useMaterial3: true,
      ),
      // Let the system decide between light and dark theme
      themeMode: ThemeMode.system,
      // Set the home page as the first screen
      home: const TaskHomePage(),
    );
  }
}