// lib/models/streak.dart
class Streak {
  int currentStreak;
  int bestStreak;
  DateTime lastCompletionDate;

  Streak({
    this.currentStreak = 0,
    this.bestStreak = 0,
    required this.lastCompletionDate,
  });

  Map<String, dynamic> toJson() => {
    'currentStreak': currentStreak,
    'bestStreak': bestStreak,
    'lastCompletionDate': lastCompletionDate.toIso8601String(),
  };

  factory Streak.fromJson(Map<String, dynamic> json) => Streak(
    currentStreak: json['currentStreak'],
    bestStreak: json['bestStreak'],
    lastCompletionDate: DateTime.parse(json['lastCompletionDate']),
  );
}