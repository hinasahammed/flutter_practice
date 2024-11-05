import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  Future initialize() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Got a message whilst in the foreground!');
      log('Message data: ${message.data}');

      if (message.notification != null) {
        log('Message also contained a notification: ${message.notification}');
      }
    });
    FirebaseMessaging.onBackgroundMessage(backgroundHandler);
    await getToken();
  }

  Future<String?> getToken() async {
    String? token = await _fcm.getToken();
    log('Token: $token');
    return token;
  }

  Future<void> backgroundHandler(RemoteMessage message) async {
    log('Handling a background message ${message.messageId}');
  }
}
