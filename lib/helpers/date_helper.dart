class DateHelper {
  static int getCurrentTimeUtcInt() {
    return DateTime.now().toUtc().millisecondsSinceEpoch;
  }

  static DateTime getCurrentTimeUtc() {
    return DateTime.now().toUtc();
  }

  static String formatIntDateToHourOnly(int intTime) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(intTime);
  
    int hour = dateTime.hour;
    int minute = dateTime.minute;
    String period =  hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  // Function to format the date to a specific string
  static String formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
}