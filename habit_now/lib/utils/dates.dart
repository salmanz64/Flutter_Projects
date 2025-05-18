List days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

String converDateTOString(DateTime dateTime) {
  String year = dateTime.year.toString();

  String month = dateTime.month.toString();
  if (month.length == 1) {
    month = '0' + month;
  }

  String day = dateTime.day.toString();
  if (day.length == 1) {
    day = '0' + day;
  }

  String yyyymmdd = year + month + day;

  return yyyymmdd;
}

DateTime convertStringToDate(String date) {
  int year = int.parse(date.substring(0, 4));
  int month = int.parse(date.substring(4, 6));
  int day = int.parse(date.substring(6, 8));
  return DateTime(year, month, day);
}
