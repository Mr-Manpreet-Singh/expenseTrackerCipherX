abstract class DateTimeFormat {
  static String _getMonthAbbreviation(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }

  static String formatDateTime(DateTime dateTime) {
    // Format month as "mmm"
    final monthAbbreviation = _getMonthAbbreviation(dateTime.month);

    // Format day as "dd"
    final day = dateTime.day.toString().padLeft(2, '0');

    // Format hour in 12-hour format as "hh"
    final hour = (dateTime.hour % 12 == 0)
        ? '12'
        : (dateTime.hour % 12).toString().padLeft(2, '0');

    // Format minute as "mm"
    final minute = dateTime.minute.toString().padLeft(2, '0');

    // Determine if it's AM or PM
    final amPm = (dateTime.hour < 12) ? 'AM' : 'PM';

    // Combine all parts to form the final string
    final formattedDateTime = '$day $monthAbbreviation, $hour:$minute $amPm';

    return formattedDateTime;
  }
}
