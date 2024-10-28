import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessages extends StatefulWidget {
  const NewMessages({super.key});

  @override
  State<NewMessages> createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  final _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _messageController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Send a message..",
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            sendMessage();
          },
          icon: const Icon(Icons.send),
        )
      ],
    );
  }

  Future sendMessage() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      return;
    }
    final userData = await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser.uid)
        .get();
    await FirebaseFirestore.instance.collection("chat").doc().set({
      "message": _messageController.text,
      "createdAt": Timestamp.now(),
      "uid": currentUser.uid,
      "userImage": userData.data()!['imageUrl'],
      "userName": userData.data()!['username'],
    });
    _messageController.clear();
  }
}
