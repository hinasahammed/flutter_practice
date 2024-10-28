import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatefulWidget {
  const ChatMessages({super.key});

  @override
  State<ChatMessages> createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currenUser = FirebaseAuth.instance.currentUser;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("chat")
          .orderBy("createdAt", descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text("No messages found"),
          );
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text("Something went wrong"),
          );
        }

        final messages = snapshot.data!.docs;

        return ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final data = messages[index];
            return Row(
              children: [
                if (data['uid'] != currenUser!.uid)
                  CircleAvatar(
                    backgroundImage: NetworkImage(data['userImage']),
                  ),
                Expanded(
                  child: Card(
                    color: data['uid'] == currenUser.uid
                        ? theme.colorScheme.primaryContainer
                        : theme.colorScheme.secondary,
                    child: ListTile(
                      title: Text(
                        data['message'],
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: data['uid'] == currenUser.uid
                              ? theme.colorScheme.onPrimaryContainer
                              : theme.colorScheme.onSecondary,
                        ),
                        textDirection: data['uid'] == currenUser.uid
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                      ),
                    ),
                  ),
                ),
                if (data['uid'] == currenUser.uid)
                  CircleAvatar(
                    backgroundImage: NetworkImage(data['userImage']),
                  ),
              ],
            );
          },
        );
      },
    );
  }
}
