# Flutter Todo App with Streak System

A modern Flutter todo application that helps users maintain daily productivity through a streak-based system.

## Features

- **Clean Material Design UI**: Modern and intuitive user interface following Material Design 3 guidelines
- **Daily Streak System**: Track your daily usage and maintain productivity streaks
- **Task Management**:
  - Create, update, and delete tasks
  - Mark tasks as complete/incomplete
  - Add task descriptions and due dates
  - View tasks organized by date
- **Theme Support**: Supports both light and dark themes
- **Local Notifications**: Get reminders for your pending tasks
- **Persistent Storage**: Tasks and streaks are saved locally

## Getting Started

### Prerequisites

- Flutter SDK (Latest Version)
- Android Studio / VS Code
- Git

### Installation

1. Clone the repository
git clone https://github.com/NArayan1703/flutter-todo-app.git

## Project Structure
lib/
├── main.dart
├── models/
│   └── task.dart
├── providers/
│   ├── task_provider.dart
│   └── theme_provider.dart
├── screens/
│   ├── home_screen.dart
│   ├── task_list_screen.dart
│   └── settings_screen.dart
└── services/
    ├── notification_service.dart
    ├── storage_service.dart
    └── streak_service.dart

    
## Dependencies
provider: State management
shared_preferences: Local storage
flutter_local_notifications: Push notifications
Other Flutter standard libraries


Contact
NArayan1703 - GitHub Profile

Project Link: https://github.com/NArayan1703/flutter-todo-app
