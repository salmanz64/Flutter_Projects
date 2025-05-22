import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:permission_handler/permission_handler.dart';

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

    // ✅ Request notification permission on Android 13+
    if (await Permission.notification.isDenied) {
      final result = await Permission.notification.request();
      print("Notification permission: $result");
    }
  }

  void shownotificaton(String title, String body) async {
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

  void scheduleNotification(
    int id,
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
      id,
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

  Future<void> removeTheHabitsNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
}
