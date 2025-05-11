import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class ShowLocalNotification {
  // Initialization
  ShowLocalNotification() {
    tz.initializeTimeZones(); // Initialize timezones when creating an instance
    _initializeNotifications(); // Initialize notification plugin
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void _initializeNotifications() async {
    const AndroidInitializationSettings androidInitSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings = InitializationSettings(
      android: androidInitSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  void shownotificaton(String title, String body) async {
    print("hi");
    var android = AndroidNotificationDetails(
      'channel_id',
      'channel_NAME',
      priority: Priority.high,
      importance: Importance.max,
    );
    var platform = NotificationDetails(android: android);
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platform,
      payload: 'Welcome to the Local Notification demo ',
    );
  }

  // Future<void> scheduleNotification(String title, String body) async {
  //   // Debug: Print current timezone

  //   // Configure notification
  //   const android = AndroidNotificationDetails(
  //     'channel_id',
  //     'channel_NAME',
  //     importance: Importance.max,
  //     priority: Priority.high,
  //   );
  //   final platform = NotificationDetails(android: android);

  //   // Schedule in IST (current time + 5 seconds)
  //   final scheduledTime = tz.TZDateTime.now(tz.local).add(Duration(seconds: 5));
  //   print("Scheduled time (IST): $scheduledTime"); // Check for +05:30

  //   await flutterLocalNotificationsPlugin.zonedSchedule(
  //     0,
  //     title,
  //     body,
  //     scheduledTime,
  //     platform,
  //     androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
  //     uiLocalNotificationDateInterpretation:
  //         UILocalNotificationDateInterpretation.absoluteTime,
  //   );
  // }

  void scheduleNotification(
    String title,
    String body,
    int hour,
    int minute,
  ) async {
    var android = AndroidNotificationDetails(
      'channel_id',
      'channel_NAME',
      priority: Priority.high,
      importance: Importance.max,
    );
    var platform = NotificationDetails(android: android);

    final now = tz.TZDateTime.now(tz.local);

    tz.setLocalLocation(tz.getLocation('Asia/Kolkata'));

    tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(Duration(days: 1));
    }

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      scheduledDate,
      platform,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents:
          DateTimeComponents
              .time, // Ensures it repeats daily at the specified time
    );
    print("Notification scheduled for $hour:$minute daily");
  }
}
