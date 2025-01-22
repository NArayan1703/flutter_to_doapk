// lib/services/streak_service.dart
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StreakService {
  static final StreakService _instance = StreakService._internal();
  factory StreakService() => _instance;
  StreakService._internal();

  late SharedPreferences _prefs;
  static const String _lastLoginKey = 'last_login';
  static const String _currentStreakKey = 'current_streak';
  static const String _bestStreakKey = 'best_streak';

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> recordLogin() async {
    final now = DateTime.now();
    final lastLogin = await getLastLogin();

    if (lastLogin == null) {
      await _prefs.setInt(_currentStreakKey, 1);
    } else {
      final difference = now.difference(lastLogin).inDays;
      final currentStreak = await getCurrentStreak();

      if (difference == 1) {
        // Consecutive day
        await _prefs.setInt(_currentStreakKey, currentStreak + 1);
        final bestStreak = await getBestStreak();
        if (currentStreak + 1 > bestStreak) {
          await _prefs.setInt(_bestStreakKey, currentStreak + 1);
        }
      } else if (difference > 1) {
        // Streak broken
        await _prefs.setInt(_currentStreakKey, 1);
      }
    }

    await _prefs.setString(_lastLoginKey, now.toIso8601String());
  }

  Future<DateTime?> getLastLogin() async {
    final lastLoginStr = _prefs.getString(_lastLoginKey);
    return lastLoginStr != null ? DateTime.parse(lastLoginStr) : null;
  }

  Future<int> getCurrentStreak() async {
    return _prefs.getInt(_currentStreakKey) ?? 0;
  }

  Future<int> getBestStreak() async {
    return _prefs.getInt(_bestStreakKey) ?? 0;
  }
}