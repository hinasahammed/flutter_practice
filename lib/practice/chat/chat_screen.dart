import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_practice/practice/chat/push_notification_service.dart';
import 'package:flutter_practice/practice/chat/widgets/chat_messages.dart';
import 'package:flutter_practice/practice/chat/widgets/new_messages.dart';
import 'package:flutter_practice/practice/tabBar/chats_view.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    // Check what is inside the message object
    RemoteNotification? notification = message.notification;
    //AndroidNotification? android = message.notification?.android;

    log("notification: $notification");
    log("message data: ${message.data}");

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ChatsView(),
        ));
  }

  @override
  void initState() {
    super.initState();
    setupInteractedMessage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat screen"),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(child: ChatMessages()),
            NewMessages(),
          ],
        ),
      ),
    );
  }
}
