// lib/services/storage_service.dart
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task.dart';
import '../models/streak.dart';
import '../models/quote.dart';
class StorageService {
  static const String TASKS_KEY = 'tasks';
  static const String STREAK_KEY = 'streak';
  static const String LAST_QUOTE_KEY = 'last_quote';
  static const String LAST_QUOTE_DATE_KEY = 'last_quote_date';

  late final SharedPreferences _prefs;

  // Singleton pattern
  static final StorageService _instance = StorageService._internal();

  factory StorageService() => _instance;

  StorageService._internal();

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Tasks Methods
  Future<List<Task>> getTasks() async {
    final String? tasksJson = _prefs.getString(TASKS_KEY);
    if (tasksJson == null) return [];

    final List<dynamic> decodedTasks = json.decode(tasksJson);
    return decodedTasks.map((task) => Task.fromJson(task)).toList();
  }

  Future<void> saveTasks(List<Task> tasks) async {
    final String tasksJson = json.encode(
      tasks.map((task) => task.toJson()).toList(),
    );
    await _prefs.setString(TASKS_KEY, tasksJson);
  }

  // Streak Methods
  Future<Streak> getStreak() async {
    final String? streakJson = _prefs.getString(STREAK_KEY);
    if (streakJson == null) {
      return Streak(lastCompletionDate: DateTime.now());
    }
    return Streak.fromJson(json.decode(streakJson));
  }

  Future<void> saveStreak(Streak streak) async {
    final String streakJson = json.encode(streak.toJson());
    await _prefs.setString(STREAK_KEY, streakJson);
  }

  // Quote Methods
  Future<Quote?> getLastQuote() async {
    final String? quoteJson = _prefs.getString(LAST_QUOTE_KEY);
    if (quoteJson == null) return null;
    return Quote.fromJson(json.decode(quoteJson));
  }

  Future<void> saveLastQuote(Quote quote) async {
    final String quoteJson = json.encode(quote.toJson());
    await _prefs.setString(LAST_QUOTE_KEY, quoteJson);
    await _prefs.setString(
      LAST_QUOTE_DATE_KEY,
      DateTime.now().toIso8601String(),
    );
  }

  Future<DateTime?> getLastQuoteDate() async {
    final String? dateStr = _prefs.getString(LAST_QUOTE_DATE_KEY);
    if (dateStr == null) return null;
    return DateTime.parse(dateStr);
  }

  // Clear all data
  Future<void> clearAll() async {
    await _prefs.clear();
  }
}