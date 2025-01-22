// lib/widgets/streak_widget.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';
import '../utils/constants.dart';

class StreakWidget extends StatelessWidget {
  const StreakWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) {
        final streak = taskProvider.streak;

        return Card(
          margin: const EdgeInsets.all(AppConstants.defaultPadding),
          child: Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Current Streak',
                      style: AppConstants.titleStyle,
                    ),
                    _buildStreakBadge(streak.currentStreak),
                  ],
                ),
                const SizedBox(height: AppConstants.defaultPadding),
                LinearProgressIndicator(
                  value: _getProgressValue(streak.currentStreak),
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    _getStreakColor(streak.currentStreak),
                  ),
                ),
                const SizedBox(height: AppConstants.smallPadding),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Best: ${streak.bestStreak} days',
                      style: AppConstants.captionStyle,
                    ),
                    Text(
                      _getStreakMessage(streak.currentStreak),
                      style: AppConstants.captionStyle.copyWith(
                        color: _getStreakColor(streak.currentStreak),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStreakBadge(int streakCount) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
        vertical: AppConstants.smallPadding,
      ),
      decoration: BoxDecoration(
        color: _getStreakColor(streakCount),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.local_fire_department,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: 4),
          Text(
            '$streakCount days',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  double _getProgressValue(int streak) {
    if (streak <= 7) return streak / 7;
    if (streak <= 30) return streak / 30;
    if (streak <= 100) return streak / 100;
    return 1.0;
  }

  Color _getStreakColor(int streak) {
    if (streak < 3) return Colors.blue;
    if (streak < 7) return Colors.green;
    if (streak < 30) return Colors.orange;
    return Colors.red;
  }

  String _getStreakMessage(int streak) {
    if (streak == 0) return 'Start your streak!';
    if (streak < 3) return 'Keep going!';
    if (streak < 7) return 'You\'re doing great!';
    if (streak < 30) return 'Impressive!';
    return 'Amazing!';
  }
}