import 'dart:math';

abstract class GenerateTransactionID {
  static String generateTransactionId() {
    final DateTime now = DateTime.now();
    final int random = Random().nextInt(10000); // Adjust the range as needed

    final String id =
        '${now.year}${_addLeadingZero(now.month)}${_addLeadingZero(now.day)}'
        '${_addLeadingZero(now.hour)}${_addLeadingZero(now.minute)}'
        '${_addLeadingZero(now.second)}${_addLeadingZero(now.millisecond)}'
        '${_addLeadingZero(now.microsecond)}$random';

    return id;
  }

  static String _addLeadingZero(int number) {
    return number.toString().padLeft(2, '0');
  }
}
