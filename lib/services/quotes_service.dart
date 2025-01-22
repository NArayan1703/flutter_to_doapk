// lib/services/quotes_service.dart
class Quote {
  final String text;
  final String author;

  Quote({required this.text, required this.author});
}

class QuotesService {
  static final List<Quote> _quotes = [
    Quote(
        text: "The only way to do great work is to love what you do.",
        author: "Steve Jobs"
    ),
    Quote(
        text: "Don't watch the clock; do what it does. Keep going.",
        author: "Sam Levenson"
    ),
    Quote(
        text: "Success is not final, failure is not fatal: it is the courage to continue that counts.",
        author: "Winston Churchill"
    ),
    Quote(
        text: "The future depends on what you do today.",
        author: "Mahatma Gandhi"
    ),
    Quote(
        text: "Your time is limited, don't waste it living someone else's life.",
        author: "Steve Jobs"
    ),
    Quote(
        text: "Everything you can imagine is real.",
        author: "Pablo Picasso"
    ),
    Quote(
        text: "Start where you are. Use what you have. Do what you can.",
        author: "Arthur Ashe"
    ),
    Quote(
        text: "The only limit to our realization of tomorrow will be our doubts of today.",
        author: "Franklin D. Roosevelt"
    ),
  ];

  static Quote getDailyQuote() {
    final today = DateTime.now();
    final dayOfYear = today.difference(DateTime(today.year, 1, 1)).inDays;
    return _quotes[dayOfYear % _quotes.length];
  }
}