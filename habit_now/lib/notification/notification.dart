import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> initNotifications() async {
  const AndroidInitializationSettings androidInitSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initSettings = InitializationSettings(
    android: androidInitSettings,
  );

  await flutterLocalNotificationsPlugin.initialize(initSettings);
}

Future<void> createNotificationChannel() async {
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'daily_habit_id', // Channel ID
    'Daily Habit', // Channel Name
    description: 'This channel is for daily habit reminders',
    importance: Importance.high,
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >()
      ?.createNotificationChannel(channel);
}

Future<void> scheduleDailyNotification(
  TimeOfDay time,
  int id,
  String title,
  String body,
) async {
  final now = DateTime.now(); // Get the current local time

  // Creating the scheduled date with today's date and the given time (hour and minute)
  final scheduledDate = DateTime(
    now.year,
    now.month,
    now.day,
    time.hour,
    time.minute,
  );

  // If the scheduled time is already past, schedule it for the next day
  final notificationTime =
      scheduledDate.isBefore(now)
          ? scheduledDate.add(Duration(days: 1)) // add one day
          : scheduledDate;

  print("Scheduling notification for: $notificationTime");

  // Scheduling the notification at the calculated notificationTime
  await flutterLocalNotificationsPlugin.zonedSchedule(
    id,
    title,
    body,
    tz.TZDateTime.from(notificationTime, tz.local), // Use timezone-based time
    const NotificationDetails(
      android: AndroidNotificationDetails(
        'daily_habit_id',
        'Daily Habit',
        channelDescription: 'Daily habit reminder',
      ),
    ),
    androidScheduleMode:
        AndroidScheduleMode
            .exactAllowWhileIdle, // Show the notification even if the device is idle
    matchDateTimeComponents:
        DateTimeComponents.time, // Repeat every day at the same time
  );
}
