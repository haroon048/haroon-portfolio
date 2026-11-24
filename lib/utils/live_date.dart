class LiveDate {
  static const List<String> _months = <String>[
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC',
  ];

  static String today() {
    final DateTime now = DateTime.now();
    final String day = now.day.toString().padLeft(2, '0');
    return '$day ${_months[now.month - 1]} — ${now.year}';
  }
}
