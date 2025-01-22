// lib/widgets/quote_widget.dart
import 'package:flutter/material.dart';
import '../models/quote.dart';
import '../services/quotes_service.dart';
import '../utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuoteWidget extends StatefulWidget {
  const QuoteWidget({Key? key}) : super(key: key);

  @override
  _QuoteWidgetState createState() => _QuoteWidgetState();
}

class _QuoteWidgetState extends State<QuoteWidget> {
  late Quote _quote;
  final QuotesService _quotesService = QuotesService();

  @override
  void initState() {
    super.initState();
    _quote = _quotesService.getDailyQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          children: [
            const Row(
              children: [
                Icon(Icons.format_quote),
                SizedBox(width: AppConstants.smallPadding),
                Text(
                  'Daily Motivation',
                  style: AppConstants.titleStyle,
                ),
              ],
            ),
            const SizedBox(height: AppConstants.defaultPadding),
            Text(
              _quote.text,
              style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            if (_quote.author != null) ...[
              const SizedBox(height: AppConstants.smallPadding),
              Text(
                '- ${_quote.author}',
                style: AppConstants.captionStyle,
              ),
            ],
            const SizedBox(height: AppConstants.defaultPadding),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: _shareQuote,
                  tooltip: 'Share Quote',
                ),
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: _refreshQuote,
                  tooltip: 'New Quote',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _shareQuote() {
    final String shareText = _quote.author != null
        ? '"${_quote.text}" - ${_quote.author}'
        : '"${_quote.text}"';
    // Implement share functionality
    // You can use the share package or platform channels
  }

  void _refreshQuote() {
    setState(() {
      _quote = _quotesService.getRandomQuote();
    });
  }
}