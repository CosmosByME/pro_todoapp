String titleGiver() {
  final year = DateTime.now().year;
  final month = DateTime.now().month;
  final day = DateTime.now().day;

  final monthName = switch (month) {
    1 => 'January',
    2 => 'February',
    3 => 'March',
    4 => 'April',
    5 => 'May',
    6 => 'June',
    7 => 'July',
    8 => 'August',
    9 => 'September',
    10 => 'October',
    11 => 'November',
    12 => 'December',
    _ => '',
  };

  return '$monthName $day, $year';

}