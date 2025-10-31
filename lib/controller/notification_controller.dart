import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

class NotificationController extends GetxController {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotif =
      FlutterLocalNotificationsPlugin();

  @override
  void onInit() {
    super.onInit();
    _initializeNotifications();
  }

  /// Inisialisasi Firebase Messaging & Local Notifications
  Future<void> _initializeNotifications() async {
    await Firebase.initializeApp();

    // Setup background handler
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Setup local notification
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: androidInit);
    await _localNotif.initialize(initSettings);

    // Minta izin
    NotificationSettings settings = await _fcm.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('✅ Izin notifikasi diberikan');
    } else {
      print('⚠️ Izin notifikasi ditolak');
    }

    // Dapatkan token perangkat
    String? token = await _fcm.getToken();
    print('📱 Token perangkat: $token');

    // Dengarkan notifikasi saat foreground
    FirebaseMessaging.onMessage.listen((message) {
      _handleForegroundMessage(message);
    });

    // Saat notifikasi diklik dari background
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('🔔 Notifikasi diklik: ${message.notification?.title}');
    });
  }

  /// Handler untuk notifikasi saat app di foreground
  void _handleForegroundMessage(RemoteMessage message) {
    print('📩 Pesan diterima di foreground: ${message.notification?.title}');
    print('Isi pesan: ${message.notification?.body}');

    final notification = message.notification;
    final android = message.notification?.android;

    if (notification != null && android != null) {
      _localNotif.show(
        notification.hashCode,
        notification.title,
        notification.body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'default_channel',
            'Default Notifications',
            channelDescription: 'Menampilkan notifikasi pesan FCM',
            importance: Importance.max,
            priority: Priority.high,
            playSound: true,
            enableVibration: true,
          ),
        ),
      );
    }
  }

  /// Handler background message
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
    print('📨 Pesan diterima di background: ${message.notification?.title}');
  }
}
