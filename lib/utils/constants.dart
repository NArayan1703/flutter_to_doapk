// lib/utils/constants.dart
import 'package:flutter/material.dart';

class AppConstants {
  // App Information
  static const String appName = 'Todo App';
  static const String appVersion = '1.0.0';
  static const String appBuildNumber = '1';

  // Storage Keys
  static const String storageKeyTasks = 'tasks';
  static const String storageKeyStreak = 'streak';
  static const String storageKeyTheme = 'theme';
  static const String storageKeyLastQuote = 'last_quote';
  static const String storageKeyNotifications = 'notifications';

  // Task Categories
  static const List<String> taskCategories = [
    'Personal',
    'Work',
    'Shopping',
    'Health',
    'Education',
    'Other',
  ];

  // Theme Colors
  static const MaterialColor primaryColor = Colors.blue;
  static const Color accentColor = Colors.blueAccent;

  // Theme Data
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: primaryColor,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
    ),
    cardTheme: const CardTheme(
      elevation: 2,
      margin: EdgeInsets.all(8),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: primaryColor,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
    ),
    cardTheme: const CardTheme(
      elevation: 2,
      margin: EdgeInsets.all(8),
    ),
  );

  // Animation Durations
  static const Duration quickAnimationDuration = Duration(milliseconds: 200);
  static const Duration normalAnimationDuration = Duration(milliseconds: 300);
  static const Duration slowAnimationDuration = Duration(milliseconds: 500);

  // Layout Constants
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double defaultBorderRadius = 8.0;
  static const double defaultIconSize = 24.0;

  // Text Styles
  static const TextStyle headlineStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle titleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle bodyStyle = TextStyle(
    fontSize: 16,
  );

  static const TextStyle captionStyle = TextStyle(
    fontSize: 14,
    color: Colors.grey,
  );

  // Streak Thresholds
  static const Map<int, String> streakMilestones = {
    7: '🎉 One week streak!',
    30: '🌟 One month streak!',
    100: '🏆 100 days streak!',
    365: '👑 One year streak!',
  };

  // Error Messages
  static const String errorGeneric = 'Something went wrong. Please try again.';
  static const String errorNoInternet = 'No internet connection.';
  static const String errorInvalidInput = 'Please enter valid information.';

  // Success Messages
  static const String successTaskAdded = 'Task added successfully!';
  static const String successTaskUpdated = 'Task updated successfully!';
  static const String successTaskDeleted = 'Task deleted successfully!';

  // Notification Settings
  static const int defaultReminderHour = 20;  // 8 PM
  static const int defaultReminderMinute = 0;

  // Date Formats
  static const String dateFormatFull = 'EEEE, MMMM d, y';
  static const String dateFormatShort = 'MMM d, y';
  static const String timeFormat = 'HH:mm';

  // Task Priority Levels
  static const Map<int, String> priorityLevels = {
    0: 'Low',
    1: 'Medium',
    2: 'High',
  };

  // Task Priority Colors
  static const Map<int, Color> priorityColors = {
    0: Colors.green,
    1: Colors.orange,
    2: Colors.red,
  };

  // Navigation
  static const String routeHome = '/';
  static const String routeTasks = '/tasks';
  static const String routeSettings = '/settings';
  static const String routeStatistics = '/statistics';

  // Validation
  static const int minTitleLength = 1;
  static const int maxTitleLength = 50;
  static const int maxDescriptionLength = 200;

  // Default Values
  static const int defaultTasksPerPage = 20;
  static const String defaultCategory = 'Personal';
  static const int defaultPriority = 1;
}