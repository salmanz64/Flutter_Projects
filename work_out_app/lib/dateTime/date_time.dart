String todayDateYYMMDD() {
  var dateTimeObject = DateTime.now();
  String year = dateTimeObject.year.toString();

  String month = dateTimeObject.month.toString();
  if (month.length == 1) {
    month = '0$month';
  }

  String day = dateTimeObject.day.toString();
  if (day.length == 1) {
    day = '0$day';
  }

  String yymmdd = year + month + day;
  return yymmdd;
}

DateTime createDateTimeObject(String yymmdd) {
  int year = int.parse(yymmdd.substring(0, 4));
  int mm = int.parse(yymmdd.substring(4, 6));
  int day = int.parse(yymmdd.substring(6, 8));

  DateTime dateTimeObject = DateTime(year, mm, day);

  return dateTimeObject;
}

String dateToString(DateTime yymmdd) {
  String year = yymmdd.year.toString();
  String month = yymmdd.month.toString();
  if (month.length == 1) {
    month = '0$month';
  }

  String day = yymmdd.day.toString();
  if (day.length == 1) {
    day = '0$day';
  }
  return year + month + day;
}
