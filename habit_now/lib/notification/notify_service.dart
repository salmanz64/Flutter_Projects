import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

class NotifyService {
  final notificationPlugin = FlutterLocalNotificationsPlugin();

  bool _isInitialized = false;

  bool get isInitialized => _isInitialized;

  Future<void> initNotification() async {
    if (_isInitialized) return; //prevent re-initialization

    //init timezone handling
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    //prepare android init settings
    const AndroidInitializationSettings initSettingAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    //prepare ios init settings
    const DarwinInitializationSettings initSettingsIOS =
        DarwinInitializationSettings(
          requestAlertPermission: true,
          requestBadgePermission: true,
          requestSoundPermission: true,
        );

    final initSettings = InitializationSettings(
      android: initSettingAndroid,
      iOS: initSettingsIOS,
    );

    //finally initialize the plugin
    await notificationPlugin.initialize(initSettings);
  }

  //Notifications Detail Setup
  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_channel_id',
        'Daily Notifications',
        channelDescription: 'Daily Notification Channel',
        importance: Importance.max,
        priority: Priority.high,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  //Show Notification
  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    return notificationPlugin.show(id, title, body, notificationDetails());
  }

  Future<void> scheduleNotification({
    int id = 1,
    required String title,
    required String body,
    required int hour,
    required int minute,
  }) async {
    final now = tz.TZDateTime.now(tz.local);

    //Create a date?Time for today
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    //Schedule the notification
    await notificationPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledDate,
      notificationDetails(),

      //Ios Specific: USe exact time specified
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,

      //Android specific: Allow notification while device in low power mode
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      //Make notification Daily
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> cancelAllNotifications() async {
    await notificationPlugin.cancelAll();
  }
}
