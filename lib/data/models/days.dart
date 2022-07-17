class Days {
  static final Map<String, String> daysMap = {
    'Monday': 'Poniedziałek',
    'Tuesday': 'Wtorek',
    'Wednesday': 'Środa',
    'Thursday': 'Czwartek',
    'Friday': 'Piątek'
  };

  static List<String> get days => List.from(daysMap.keys);

  static String? getDay(String day) => daysMap[day];

  static String getNextDay(String day) {
    final index = days.indexOf(day) + 1;
    if (index > days.length - 1) return days.first;
    return days[index];
  }

  static String getPrevDay(String day) {
    final index = days.indexOf(day) - 1;
    if (index < 0) return days.last;
    return days[index];
  }
}
